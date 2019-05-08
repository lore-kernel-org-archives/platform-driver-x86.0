From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: acer-wmi: Mark expected switch
 fall-throughs
Date: Wed, 8 May 2019 16:06:46 -0700
Message-ID: <20190508230645.GB32286@wrath>
References: <20190508164934.GA20064@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190508164934.GA20064@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 08, 2019 at 11:49:34AM -0500, Gustavo A. R. Silva wrote:
> In preparation to enabling -Wimplicit-fallthrough, mark switch
> cases where we are expecting to fall through.
> 
> This patch fixes the following warnings:
> 
> drivers/platform/x86/acer-wmi.c: In function ‘set_u32’:
> drivers/platform/x86/acer-wmi.c:1378:33: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     if (cap == ACER_CAP_WIRELESS ||
>                                  ^
> drivers/platform/x86/acer-wmi.c:1386:3: note: here
>    case ACER_WMID:
>    ^~~~
> drivers/platform/x86/acer-wmi.c:1393:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     else if (wmi_has_guid(WMID_GUID2))
>             ^
> drivers/platform/x86/acer-wmi.c:1395:3: note: here
>    default:
>    ^~~~~~~
> drivers/platform/x86/acer-wmi.c: In function ‘get_u32’:
> drivers/platform/x86/acer-wmi.c:1340:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    if (cap == ACER_CAP_MAILLED) {
>       ^
> drivers/platform/x86/acer-wmi.c:1344:2: note: here
>   case ACER_WMID:
>   ^~~~
> drivers/platform/x86/acer-wmi.c: In function ‘WMID_get_u32’:
> drivers/platform/x86/acer-wmi.c:1013:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    if (quirks->mailled == 1) {
>       ^
> drivers/platform/x86/acer-wmi.c:1018:2: note: here
>   default:
>   ^~~~~~~
> 
> Warning level 3 was used: -Wimplicit-fallthrough=3
> 
> This patch is part of the ongoing efforts to enable
> -Wimplicit-fallthrough.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index fcfeadd1301f..bd87f9037f95 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1015,6 +1015,7 @@ static acpi_status WMID_get_u32(u32 *value, u32 cap)
>  			*value = tmp & 0x1;
>  			return 0;
>  		}
> +		/* fall through */
>  	default:
>  		return AE_ERROR;
>  	}
> @@ -1341,6 +1342,7 @@ static acpi_status get_u32(u32 *value, u32 cap)
>  			status = AMW0_get_u32(value, cap);
>  			break;
>  		}
> +		/* fall through */

This doesn't strike me as obviously the right thing to do here. If the interface
type is AMW0_V2, why is it the right thing to do to use WMID_get_u32 if the cap
isn't ACER_CAP_MAILLED?

>  	case ACER_WMID:
>  		status = WMID_get_u32(value, cap);
>  		break;
> @@ -1383,6 +1385,7 @@ static acpi_status set_u32(u32 value, u32 cap)
>  
>  				return AMW0_set_u32(value, cap);
>  			}
> +			/* fall through */

Similarly here.

Are we documenting intended behavior, or covering up a bug.

>  		case ACER_WMID:
>  			return WMID_set_u32(value, cap);

-- 
Darren Hart
VMware Open Source Technology Center
