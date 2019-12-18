From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Make buffer for HPWMI_FEATURE2_QUERY
 128 bytes
Date: Wed, 18 Dec 2019 12:17:20 +0200
Message-ID: <CAHp75Vf8CDwW731uD4OMzB69P-D1AN3PzCMFBGGD4fvBFccpLg@mail.gmail.com>
References: <20191217190604.638467-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191217190604.638467-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 17, 2019 at 9:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> At least on the HP Envy x360 15-cp0xxx model the WMI interface
> for HPWMI_FEATURE2_QUERY requires an outsize of at least 128 bytes,
> otherwise it fails with an error code 5 (HPWMI_RET_INVALID_PARAMETERS):
>
> Dec 06 00:59:38 kernel: hp_wmi: query 0xd returned error 0x5
>
> We do not care about the contents of the buffer, we just want to know
> if the HPWMI_FEATURE2_QUERY command is supported.
>
> This commits bumps the buffer size, fixing the error.
>

Fixes tag?

> Cc: stable@vger.kernel.org
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1520703
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/hp-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 9579a706fc08..a881b709af25 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -300,7 +300,7 @@ static int __init hp_wmi_bios_2008_later(void)
>
>  static int __init hp_wmi_bios_2009_later(void)
>  {
> -       int state = 0;
> +       u8 state[128];
>         int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
>                                        sizeof(state), sizeof(state));
>         if (!ret)
> --
> 2.23.0
>


-- 
With Best Regards,
Andy Shevchenko
