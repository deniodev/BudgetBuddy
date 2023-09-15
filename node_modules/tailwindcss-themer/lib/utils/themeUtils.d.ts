import { TailwindExtension } from '../config';
import { ThemeConfig } from './optionsUtils';
import { PluginAPI } from 'tailwindcss/types/config';
/**
 * @param themeExtension - the theme extension to convert to custom props
 * @param api - the tailwind plugin helpers
 * @return the theme extension resolved as custom props
 */
export declare const resolveThemeExtensionAsCustomProps: (themeExtension: TailwindExtension, api: PluginAPI) => {
    [key: string]: string;
};
/**
 * @param themes - the themes to convert to a tailwind extension
 * @return the resolved tailwind extension from the given theme
 * @throws an {@link Error} if any callbacks are found in places not supported by tailwind
 */
export declare const resolveThemeExtensionsAsTailwindExtension: (themes: ThemeConfig[]) => TailwindExtension;
