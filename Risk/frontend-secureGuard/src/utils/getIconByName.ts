import React, { ReactElement } from "react";

import { IconType } from "react-icons";
import * as FaIcons from "react-icons/fa";
import * as Fa6Icons from "react-icons/fa6";
import * as FiIcons from "react-icons/fi";
import * as IoIcons from "react-icons/io"
import * as CiIcons from "react-icons/ci"
import * as VscIcons from "react-icons/vsc";
import * as MdIcons from "react-icons/md";
import * as RiIcons from "react-icons/ri";
import * as PiIcons from "react-icons/pi";
import * as Io5Icons from "react-icons/io5";
import * as GiIcons from "react-icons/gi";
import * as SiIcons from "react-icons/si";

export interface IconProps<T extends keyof IconLibrary> {
  name: T;
  library: "fa" | "fa6" | "fi" | "io" | "ci" | "vsc" | "md" | "ri" | "pi" | "io5" | "gi" | "si"
  className?: string;
}

interface IconLibrary {
  [key: string]: IconType;
}

export function Icon<T extends keyof IconLibrary>({ name, library, ...props }: IconProps<T>): ReactElement | null {
  const libraries = {
    fa: FaIcons,
    fa6: Fa6Icons,
    fi: FiIcons,
    io: IoIcons,
    ci: CiIcons,
    vsc: VscIcons,
    md: MdIcons,
    ri: RiIcons,
    pi: PiIcons,
    io5: Io5Icons,
    gi: GiIcons,
    si: SiIcons,
  };
  const IconLibrary: IconLibrary = libraries[library];

  return IconLibrary ? React.createElement(IconLibrary[name], { ...props }) : null;
}
