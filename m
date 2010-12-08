From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for December 8 (drivers/platform/x86/Kconfig:422:error:
 recursive dependency detected!)
Date: Wed, 8 Dec 2010 10:18:44 +0100
Message-ID: <AANLkTin15LKaDLsd0JX=wwPOOBxkkaXTK5ojc30zoxJJ@mail.gmail.com>
References: <AANLkTim3FJjVpbjM10kJJhXbONpvGSGQFE+mfGX9pAS6@mail.gmail.com>
	<AANLkTimjVY-6OwRfFUzUbmyacM81M35wf5qDWqAouUYb@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTimjVY-6OwRfFUzUbmyacM81M35wf5qDWqAouUYb@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Johannes Berg <johannes.berg@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Dec 8, 2010 at 10:12 AM, Corentin Chary
<corentin.chary@gmail.com> wrote:
> On Wed, Dec 8, 2010 at 9:17 AM, Sedat Dilek <sedat.dilek@googlemail.c=
om> wrote:
>> Hi,
>>
>> just wanted to build a new linux-next and see this:
>>
>> [ setup.log ]
>> ...
>> dileks.1" make -C 'debian/build/source_i386_none'
>> O=3D'/home/sd/src/linux-2.6/linux-2.6.37-rc5/debian/build/build_i386=
_none_686'
>> oldnoconfig
>> make[2]: Entering directory
>> `/home/sd/src/linux-2.6/linux-2.6.37-rc5/debian/build/source_i386_no=
ne'
>> =C2=A0HOSTCC =C2=A0scripts/basic/fixdep
>> =C2=A0HOSTCC =C2=A0scripts/basic/docproc
>> =C2=A0GEN =C2=A0 =C2=A0 /home/sd/src/linux-2.6/linux-2.6.37-rc5/debi=
an/build/build_i386_none_686/Makefile
>> =C2=A0HOSTCC =C2=A0scripts/kconfig/conf.o
>> =C2=A0HOSTCC =C2=A0scripts/kconfig/kxgettext.o
>> =C2=A0SHIPPED scripts/kconfig/zconf.tab.c
>> =C2=A0SHIPPED scripts/kconfig/lex.zconf.c
>> =C2=A0SHIPPED scripts/kconfig/zconf.hash.c
>> =C2=A0HOSTCC =C2=A0scripts/kconfig/zconf.tab.o
>> =C2=A0HOSTLD =C2=A0scripts/kconfig/conf
>> scripts/kconfig/conf --oldnoconfig Kconfig
>> drivers/platform/x86/Kconfig:422:error: recursive dependency detecte=
d!
>> drivers/platform/x86/Kconfig:422: =C2=A0 =C2=A0 =C2=A0 symbol EEEPC_=
WMI depends on ACPI_WMI
>> drivers/platform/x86/Kconfig:438: =C2=A0 =C2=A0 =C2=A0 symbol ACPI_W=
MI is selected by ACER_WMI
>> drivers/platform/x86/Kconfig:18: =C2=A0 =C2=A0 =C2=A0 =C2=A0symbol A=
CER_WMI depends on LEDS_CLASS
>> drivers/leds/Kconfig:10: =C2=A0 =C2=A0 =C2=A0 =C2=A0symbol LEDS_CLAS=
S is selected by EEEPC_WMI
>> warning: (ADB_PMU_LED && MACINTOSH_DRIVERS && ADB_PMU || ATH5K &&
>> NETDEVICES && WLAN && ATH_COMMON && (PCI || ATHEROS_AR231X) &&
>> MAC80211 || ATH9K && NETDEVICES && WLAN && ATH_COMMON && PCI &&
>> MAC80211 || ATH9K_HTC && NETDEVICES && WLAN && ATH_COMMON && USB &&
>> MAC80211 || CARL9170_LEDS && NETDEVICES && WLAN && ATH_COMMON &&
>> CARL9170 || INPUT_WISTRON_BTNS && !S390 && INPUT && INPUT_MISC && X8=
6
>> && !X86_64 || SENSORS_APPLESMC && HWMON && INPUT && X86 ||
>> SENSORS_LIS3LV02D && HWMON && ACPI && INPUT || IR_WINBOND_CIR &&
>> MEDIA_SUPPORT && X86 && PNP && RC_CORE || BACKLIGHT_ADP8860 &&
>> HAS_IOMEM && BACKLIGHT_LCD_SUPPORT && BACKLIGHT_CLASS_DEVICE && I2C =
||
>> MSM_STAGING && STAGING && !STAGING_EXCLUDE_BUILD && FB && ARCH_MSM &=
&
>> !FB_MSM || ASUS_LAPTOP && X86 && X86_PLATFORM_DEVICES && ACPI &&
>> !ACPI_ASUS && INPUT && (RFKILL || RFKILL=3Dn) || THINKPAD_ACPI && X8=
6 &&
>> X86_PLATFORM_DEVICES && ACPI && INPUT && (RFKILL || RFKILL=3Dn) ||
>> EEEPC_LAPTOP && X86 && X86_PLATFORM_DEVICES && ACPI && INPUT &&
>> EXPERIMENTAL && (RFKILL || RFKILL=3Dn) && HOTPLUG_PCI || EEEPC_WMI &=
&
>> X86 && X86_PLATFORM_DEVICES && ACPI_WMI && INPUT && EXPERIMENTAL &&
>> BACKLIGHT_CLASS_DEVICE && (RFKILL || RFKILL=3Dn)) selects LEDS_CLASS
>> which has unmet direct dependencies (NEW_LEDS)
>> #
>> # configuration written to .config
>> #
>> make[2]: Leaving directory
>> `/home/sd/src/linux-2.6/linux-2.6.37-rc5/debian/build/source_i386_no=
ne'
>> env -u ABINAME -u ARCH -u FEATURESET -u FLAVOUR -u VERSION -u
>> LOCALVERSION DISTRIBUTION_OFFICIAL_BUILD=3D1
>> DISTRIBUTION_UPLOADER=3Dsedat.dilek@gmail.com
>> DISTRIBUTION_VERSION=3D"2.6.37~rc5-1~next20101208.dileks.1" make -C
>> 'debian/build/source_i386_none'
>> O=3D'/home/sd/src/linux-2.6/linux-2.6.37-rc5/debian/build/build_i386=
_none_686'
>> =C2=A0prepare
>> make[2]: Entering directory
>> `/home/sd/src/linux-2.6/linux-2.6.37-rc5/debian/build/source_i386_no=
ne'
>> =C2=A0GEN =C2=A0 =C2=A0 /home/sd/src/linux-2.6/linux-2.6.37-rc5/debi=
an/build/build_i386_none_686/Makefile
>> scripts/kconfig/conf --silentoldconfig Kconfig
>> drivers/platform/x86/Kconfig:422:error: recursive dependency detecte=
d!
>> drivers/platform/x86/Kconfig:422: =C2=A0 =C2=A0 =C2=A0 symbol EEEPC_=
WMI depends on ACPI_WMI
>> drivers/platform/x86/Kconfig:438: =C2=A0 =C2=A0 =C2=A0 symbol ACPI_W=
MI is selected by ACER_WMI
>> drivers/platform/x86/Kconfig:18: =C2=A0 =C2=A0 =C2=A0 =C2=A0symbol A=
CER_WMI depends on LEDS_CLASS
>> drivers/leds/Kconfig:10: =C2=A0 =C2=A0 =C2=A0 =C2=A0symbol LEDS_CLAS=
S is selected by EEEPC_WMI
>> warning: (ADB_PMU_LED && MACINTOSH_DRIVERS && ADB_PMU || ATH5K &&
>> NETDEVICES && WLAN && ATH_COMMON && (PCI || ATHEROS_AR231X) &&
>> MAC80211 || ATH9K && NETDEVICES && WLAN && ATH_COMMON && PCI &&
>> MAC80211 || ATH9K_HTC && NETDEVICES && WLAN && ATH_COMMON && USB &&
>> MAC80211 || CARL9170_LEDS && NETDEVICES && WLAN && ATH_COMMON &&
>> CARL9170 || INPUT_WISTRON_BTNS && !S390 && INPUT && INPUT_MISC && X8=
6
>> && !X86_64 || SENSORS_APPLESMC && HWMON && INPUT && X86 ||
>> SENSORS_LIS3LV02D && HWMON && ACPI && INPUT || IR_WINBOND_CIR &&
>> MEDIA_SUPPORT && X86 && PNP && RC_CORE || BACKLIGHT_ADP8860 &&
>> HAS_IOMEM && BACKLIGHT_LCD_SUPPORT && BACKLIGHT_CLASS_DEVICE && I2C =
||
>> MSM_STAGING && STAGING && !STAGING_EXCLUDE_BUILD && FB && ARCH_MSM &=
&
>> !FB_MSM || ASUS_LAPTOP && X86 && X86_PLATFORM_DEVICES && ACPI &&
>> !ACPI_ASUS && INPUT && (RFKILL || RFKILL=3Dn) || THINKPAD_ACPI && X8=
6 &&
>> X86_PLATFORM_DEVICES && ACPI && INPUT && (RFKILL || RFKILL=3Dn) ||
>> EEEPC_LAPTOP && X86 && X86_PLATFORM_DEVICES && ACPI && INPUT &&
>> EXPERIMENTAL && (RFKILL || RFKILL=3Dn) && HOTPLUG_PCI || EEEPC_WMI &=
&
>> X86 && X86_PLATFORM_DEVICES && ACPI_WMI && INPUT && EXPERIMENTAL &&
>> BACKLIGHT_CLASS_DEVICE && (RFKILL || RFKILL=3Dn)) selects LEDS_CLASS
>> which has unmet direct dependencies (NEW_LEDS)
>> =C2=A0Using /home/sd/src/linux-2.6/linux-2.6.37-rc5/debian/build/sou=
rce_i386_none
>> as source for kernel
>> =C2=A0GEN =C2=A0 =C2=A0 /home/sd/src/linux-2.6/linux-2.6.37-rc5/debi=
an/build/build_i386_none_686/Makefile
>> =C2=A0CHK =C2=A0 =C2=A0 include/linux/version.h
>> =C2=A0UPD =C2=A0 =C2=A0 include/linux/version.h
>> =C2=A0CHK =C2=A0 =C2=A0 include/generated/utsrelease.h
>> =C2=A0UPD =C2=A0 =C2=A0 include/generated/utsrelease.h
>> =C2=A0CC =C2=A0 =C2=A0 =C2=A0kernel/bounds.s
>> =C2=A0GEN =C2=A0 =C2=A0 include/generated/bounds.h
>> =C2=A0CC =C2=A0 =C2=A0 =C2=A0arch/x86/kernel/asm-offsets.s
>> =C2=A0GEN =C2=A0 =C2=A0 include/generated/asm-offsets.h
>> =C2=A0CALL =C2=A0 =C2=A0/home/sd/src/linux-2.6/linux-2.6.37-rc5/debi=
an/build/source_i386_none/scripts/checksyscalls.sh
>> make[2]: Leaving directory
>> `/home/sd/src/linux-2.6/linux-2.6.37-rc5/debian/build/source_i386_no=
ne'
>> make[1]: Leaving directory `/home/sd/src/linux-2.6/linux-2.6.37-rc5'
>>
>> Regards,
>> - Sedat -
>> --
>> To unsubscribe from this list: send the line "unsubscribe platform-d=
river-x86" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
>>
>
> Hum ...
> ACER_WMI:
> =C2=A0select ACPI_WMI
> =C2=A0depends on LEDS_CLASS
> =C2=A0depends on NEW_LEDS
>
> EEEPC_WMI:
> =C2=A0depends on ACPI_WMI
> =C2=A0select LEDS_CLASS
> =C2=A0select NEW_LEDS
>
> I don't really see how it's a recursive dependency, but maybe it's
> time to clean this KConfig.
> What is our current policy about that ?
>
> I think we should *depends* on important subsystem (ACPI, INPUT, ...)
> and select obscure things so
> that the driver does not get lost if you don't enable the leds.
>
> depends:
> - ACPI
> - INPUT
> - EXPERIMENTAL
> - RFKILL
> - ACPI_WMI ?
> - HWMON ?
> - THERMAL ?
>
> select:
> - BACKLIGHT_CLASS_*
> - LEDS_CLASS
> - NEW_LEDS
> - INPUT_*
>
> --
> Corentin Chary
> http://xf.iksaif.net
>

[ CC Johannes Berg ]

Cloning platform-driver-x86 GIT tree and will play with the Kconfig...

Wasn't all depends/selects to LEDS_CLASS outsourced by Johannes Berg
to drivers/leds/Kconfig recently?

- Sedat -
