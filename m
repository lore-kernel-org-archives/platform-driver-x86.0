From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH TRIVIAL] asus-wmi: Fix unused function build warning
Date: Wed, 23 Jan 2013 09:35:57 +0000
Message-ID: <CAHR064jGOp7tZL4ZAmOLp5G3cWXwjBtsZVH=sL1xsxOGMoMBOg@mail.gmail.com>
References: <1358203840.10402.3.camel@lorien2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1358203840.10402.3.camel@lorien2>
Sender: linux-kernel-owner@vger.kernel.org
To: shuah.khan@hp.com
Cc: Matthew Garrett <matthew.garrett@nebula.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, shuahkhan@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 14, 2013 at 10:50 PM, Shuah Khan <shuah.khan@hp.com> wrote:
> Fix the following build warning
>
> CC [M]  drivers/platform/x86/asus-wmi.o
> drivers/platform/x86/asus-wmi.c:1356:13: warning: =E2=80=98do_nothing=
=E2=80=99 defined but not used [-Wunused-function]
>
> Signed-off-by: Shuah Khan <shuah.khan@hp.com>
> ---
>  drivers/platform/x86/asus-wmi.c |    5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index e41eae3..c11b242 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1353,11 +1353,6 @@ static int is_display_toggle(int code)
>         return 0;
>  }
>
> -static void do_nothing(void)
> -{
> -       return;
> -}
> -
>  static void asus_wmi_notify(u32 value, void *context)
>  {
>         struct asus_wmi *asus =3D context;
> --
> 1.7.9.5
>
>
>

Acked-by: Corentin Chary <corentin.chary@gmail.com>



--
Corentin Chary
http://xf.iksaif.net
