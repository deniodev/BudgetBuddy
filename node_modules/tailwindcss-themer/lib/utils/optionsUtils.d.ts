import { TailwindExtension } from '../config';
export interface ThemeConfig {
    name: string;
    selectors?: string[];
    mediaQuery?: string;
    extend: TailwindExtension;
}
export type DefaultThemeConfig = Omit<ThemeConfig, 'name' | 'selectors' | 'mediaQuery'>;
export interface MultiThemePluginOptions {
    defaultTheme?: DefaultThemeConfig;
    themes?: ThemeConfig[];
}
export declare const defaultThemeName = "__default";
/**
 * @param options
 * @throws an {@link Error} if the options are invalid
 */
export declare const validateOptions: ({ defaultTheme, themes }: MultiThemePluginOptions) => void;
/**
 * @param options
 * @return the theme options reduced down to an array of themes
 * @throws an {@link Error} if the options are invalid
 */
export declare const getThemesFromOptions: (options: MultiThemePluginOptions) => ThemeConfig[];
