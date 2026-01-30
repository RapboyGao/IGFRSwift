#!/usr/bin/env python3
import http.server
import socketserver
import os
import urllib.parse

class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        # 设置文档根目录为.github/.pages
        directory = os.path.join(os.path.dirname(__file__), '.github', '.pages')
        super().__init__(*args, directory=directory, **kwargs)
    
    def do_GET(self):
        # 处理根路径重定向
        # if self.path == '/GeoMagSwift' or self.path == '/GeoMagSwift/':
        #     # 重定向到实际文档入口
        #     self.send_response(301)
        #     self.send_header('Location', '/GeoMagSwift/documentation/geomagswift/')
        #     self.end_headers()
        #     return
        # 调用父类方法处理其他请求
        super().do_GET()
    
    def translate_path(self, path):
        # 处理基础路径GeoMagSwift
        parsed_path = urllib.parse.urlparse(path)
        path = parsed_path.path
        
        # 移除基础路径GeoMagSwift
        if path.startswith('/GeoMagSwift'):
            path = path[len('/GeoMagSwift'):]
        
        # 调用父类方法获取实际路径
        return super().translate_path(path)

if __name__ == "__main__":
    PORT = 8888
    
    # 确保.github/.pages目录存在
    pages_dir = os.path.join(os.path.dirname(__file__), '.github', '.pages')
    if not os.path.exists(pages_dir):
        os.makedirs(pages_dir)
        print(f"Created directory: {pages_dir}")
        print("Note: You need to generate the documentation first using Swift-DocC")
    
    with socketserver.TCPServer(("", PORT), CustomHTTPRequestHandler) as httpd:
        print(f"Server started at http://localhost:{PORT}/GeoMagSwift")
        print("Press Ctrl+C to stop the server")
        httpd.serve_forever()