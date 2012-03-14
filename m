From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: drivers/platform/x86/acer-wmi.c: Support for another Lenovo Ideapad
 S205
Date: Wed, 14 Mar 2012 14:16:15 +0800
Message-ID: <4F6037AF.3050002@canonical.com>
References: <4F600A1D.5060002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:46114 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965222Ab2CNGQZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Mar 2012 02:16:25 -0400
In-Reply-To: <4F600A1D.5060002@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vaclav Mocek <vmocek@gmail.com>
Cc: jlee@novell.com, mjg@redhat.com, platform-driver-x86@vger.kernel.org

Hi Vaclav,

Could you try this just-merged patch and see if it fix your problem?

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=461e74377cfcfc2c0d6bbdfa8fc5fbc21b052c2a

On 03/14/2012 11:01 AM, Vaclav Mocek wrote:
> Hi all,
> 
> I am an unhappy owner of Lenovo Ideapad S205 and the drivers in the current development kernel (2f1c2b8) soft-blocks its Wi-Fi. S205 loads two kernel modules - ideapad-laptop.c and acer-wmi.c. The rfkill is controlled by acer-wmi.c and there is already a support for S205:
> 
>     {
>         .callback = dmi_matched,
>         .ident = "Lenovo Ideapad S205",
>         .matches = {
>             DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>             DMI_MATCH(DMI_PRODUCT_NAME, "10382LG"),
>         },
>         .driver_data = &quirk_lenovo_ideapad_s205,
>     },
> 
> Unfortunately, my netbook has a different DMI_PRODUCT_NAME - "Brazos" instead of "10382LG" and there are at least eighteen possibilities [1]. I spent some time Googling, comparing Smolt profiles, reading S205 Hardware Maintenance Manual [2]  and analysing the BIOS updates. It seems, that all S205 are based on AMD platform called "Inagua" (E300, E350, E450), use two types of Wi-Fi cards (RaLink RT3090 and AR9285), various combination of SO DIMMs (2 x 1GB, 1 x 2GB, 2 x 2GB), different sizes of hardrives and different keyboard layouts; so overall there are pretty much the same.
> 
> There is a rare netbook called Lenovo Ideapad S205s ("s" at the end), but this one is based on Intel's processors [3].
> 
> My proposal is very simple:
> 
>     {
>          .callback = dmi_matched,
>          .ident = "Lenovo Ideapad S205",
>          .matches = {
>              DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "10382LG"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Ideapad S205"),
>          },
>          .driver_data = &quirk_lenovo_ideapad_s205,
>      },
> 
> It works. We are not able to test all product names and if the checking of DMI_PRODUCT_NAME is really required, it should be done in an additional step. The current situation is pretty bad - problems with UEFI booting (the only possibility)[4], impossibility to switch the power off, failing brightness control - and without a functional network connection for a start, it is better to throw it out of the window.
> 
> [1] http://smolt.fedoraproject.org/reports/view_profiles?profile=Ideapad+S205&search=Submit+Query
> [2] http://www.manualowl.com/m/Lenovo/IdeaPad-S205/Manual/192357
> [3] http://www.manualowl.com/m/Lenovo/IdeaPad-S205s/Manual/227621
> [4] http://fedoraproject.org/wiki/Common_F16_bugs#UEFI_install_to_Lenovo_Ideapad_S205_fails_to_boot
> 
> 
> Best Regards
> 
> Vaclav Mocek
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
