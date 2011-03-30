From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: Re: [PATCH 09/23] hdaps: Convert printks to pr_<level>
Date: Tue, 29 Mar 2011 22:54:21 -0300
Message-ID: <AANLkTikWbHSPaCTStEz5v=gEvm-nG6MU2eSCq9G8eZtD@mail.gmail.com>
References: <cover.1301436234.git.joe@perches.com> <f4fbd2191533fd96fa59ba19c9917ed679920e1b.1301436234.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:64993 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754108Ab1C3Bym convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Mar 2011 21:54:42 -0400
In-Reply-To: <f4fbd2191533fd96fa59ba19c9917ed679920e1b.1301436234.git.joe@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Matthew Garrett <mjg@redhat.com>, Frank Seidel <frank@f-seidel.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 29, 2011 at 19:21, Joe Perches <joe@perches.com> wrote:
> Added pr_fmt, converted printks and removed
> hard coded prefixes.
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> =A0drivers/platform/x86/hdaps.c | =A0 19 ++++++++++---------
> =A01 files changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/x86/hdaps.c b/drivers/platform/x86/hdap=
s.c
> index 067bf36..5a34973 100644
> --- a/drivers/platform/x86/hdaps.c
> +++ b/drivers/platform/x86/hdaps.c
> @@ -26,6 +26,8 @@
> =A0* 51 Franklin Street, Fifth Floor, Boston, MA =A002110-1301, USA
> =A0*/
>
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> =A0#include <linux/delay.h>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/input-polldev.h>
> @@ -238,7 +240,7 @@ static int hdaps_device_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __check_latch(0x1611, 0x01))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
>
> - =A0 =A0 =A0 printk(KERN_DEBUG "hdaps: initial latch check good (0x%=
02x).\n",
> + =A0 =A0 =A0 printk(KERN_DEBUG "hdaps: initial latch check good (0x%=
02x)\n",

Shouldn't this be pr_debug() or pr_devel() ?



Lucas De Marchi
