From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH -next] eeepc-wmi: depends on INPUT_SPARSEKMAP
Date: Tue, 13 Apr 2010 15:39:34 -0700
Message-ID: <201004131539.34998.dmitry.torokhov@gmail.com>
References: <20100413163427.8acd04e5.sfr@canb.auug.org.au> <20100413094544.38369da9.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20100413094544.38369da9.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Matthew Garrett <mjg@redhat.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 13 April 2010 09:45:44 am Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> When EEEPC_WMI=y and INPUT_SPARSEKMAP=m, the build fails,
> so make EEEPC_WMI depend on INPUT_SPARSEKMAP.
> 
> eeepc-wmi.c:(.text+0x28d1a9): undefined reference to `sparse_keymap_setup'
> eeepc-wmi.c:(.text+0x28d1f9): undefined reference to `sparse_keymap_free'
> eeepc-wmi.c:(.text+0x28d2e0): undefined reference to
> `sparse_keymap_report_event' eeepc-wmi.c:(.init.text+0x17069): undefined
> reference to `sparse_keymap_free' eeepc-wmi.c:(.exit.text+0x2bae):
> undefined reference to `sparse_keymap_free'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
>  drivers/platform/x86/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20100413.orig/drivers/platform/x86/Kconfig
> +++ linux-next-20100413/drivers/platform/x86/Kconfig
> @@ -388,7 +388,7 @@ config EEEPC_LAPTOP
>  config EEEPC_WMI
>  	tristate "Eee PC WMI Hotkey Driver (EXPERIMENTAL)"
>  	depends on ACPI_WMI
> -	depends on INPUT
> +	depends on INPUT && INPUT_SPARSEKMAP

"select INPUT_SPARSEKMAP" please - users should not be concerned about
such implementation details.

-- 
Dmitry
