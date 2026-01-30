import Foundation

internal enum I18n {
    private static func string(_ key: String, _ fallback: String) -> String {
        Bundle.module.localizedString(forKey: key, value: fallback, table: nil)
    }

    static let magneticFieldSolutionTitle = string("magnetic_field_solution_title", "Magnetic Field Solution")
    static let mainFieldTitle = string("magnetic_field_solution_main_field", "Main Field")
    static let secularVariationTitle = string("magnetic_field_solution_secular_variation", "Secular Variation")

    static let north = string("magnetic_field_solution_north", "North")
    static let east = string("magnetic_field_solution_east", "East")
    static let down = string("magnetic_field_solution_down", "Down")
    static let horizontalIntensity = string("magnetic_field_solution_horizontal_intensity", "Horizontal Intensity")
    static let totalIntensity = string("magnetic_field_solution_total_intensity", "Total Intensity")
    static let declination = string("magnetic_field_solution_declination", "Declination")
    static let inclination = string("magnetic_field_solution_inclination", "Inclination")

    static let unitNT = string("magnetic_field_solution_unit_nt", "nT")
    static let unitNTPerYear = string("magnetic_field_solution_unit_nt_per_year", "nT/year")
    static let unitDegree = string("magnetic_field_solution_unit_degree", "°")
    static let unitArcMinPerYear = string("magnetic_field_solution_unit_arcmin_per_year", "arcmin/year")
}
