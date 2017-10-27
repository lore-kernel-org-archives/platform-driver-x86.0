From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] hp_accel: Add accelerometer quirk for HP ProBook 440 G4
Date: Fri, 27 Oct 2017 19:30:41 +0300
Message-ID: <CAHp75Vf6JgQnKiPRGVkpeR=fj_7YTBp5Re4WxSuCUwOXysgE=w@mail.gmail.com>
References: <DB6PR07MB31265A5AD192563695B8B929FA4E0@DB6PR07MB3126.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:54199 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751145AbdJ0Qan (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Oct 2017 12:30:43 -0400
In-Reply-To: <DB6PR07MB31265A5AD192563695B8B929FA4E0@DB6PR07MB3126.eurprd07.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Osama Khan <osama.khan@ericsson.com>
Cc: "eric.piel@tremplin-utc.net" <eric.piel@tremplin-utc.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Oct 21, 2017 at 1:42 PM, Osama Khan <osama.khan@ericsson.com> wrote:
> Added support for HP ProBook 440 G4 laptops by including the accelerometer
> orientation quirk for that device. Testing was performed based on the
> axis orientation guidelines here:
> https://www.kernel.org/doc/Documentation/misc-devices/lis3lv02d
> which states "If the left side is elevated, X increases (becomes positive)"
>
> When tested, on lifting the left edge, x values became increasingly negative
> thus indicating an inverted x-axis on the installed lis3lv02d chip.
> This was compensated by adding an entry for this device in hp_accel.c
> specifying the quirk as x_inverted. The patch was tested on a
> ProBook 440 G4 device and x-axis as well as y and z-axis values are now
> generated as per spec.
>

Thanks for the patch.

First of all, indentation is mangled and it doesn't clearly applies.
Second, we use a prefix platform/x86 for patches against PDx86 subsystem.

P.S. No need to resend this time, just check your mail client and be
aware about the prefix in the future.

> Signed-off-by: Osama Khan <osama.khan@ericsson.com>
> ---
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
> index 493d8910a74e..7b12abe86b94 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -240,6 +240,7 @@ static const struct dmi_system_id lis3lv02d_dmi_ids[] = {
>         AXIS_DMI_MATCH("HDX18", "HP HDX 18", x_inverted),
>         AXIS_DMI_MATCH("HPB432x", "HP ProBook 432", xy_rotated_left),
>         AXIS_DMI_MATCH("HPB440G3", "HP ProBook 440 G3", x_inverted_usd),
> +       AXIS_DMI_MATCH("HPB440G4", "HP ProBook 440 G4", x_inverted),
>         AXIS_DMI_MATCH("HPB442x", "HP ProBook 442", xy_rotated_left),
>         AXIS_DMI_MATCH("HPB452x", "HP ProBook 452", y_inverted),
>         AXIS_DMI_MATCH("HPB522x", "HP ProBook 522", xy_swap),



-- 
With Best Regards,
Andy Shevchenko
