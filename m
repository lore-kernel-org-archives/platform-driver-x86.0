From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 3/8] eeepc-laptop: define rfkill notifier nodes only once
Date: Mon, 27 Oct 2014 22:12:20 -0700
Message-ID: <20141028051220.GE60814@vmdeb7>
References: <1414005163-3461-1-git-send-email-fransklaver@gmail.com>
 <1414005163-3461-4-git-send-email-fransklaver@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1414005163-3461-4-git-send-email-fransklaver@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frans Klaver <fransklaver@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 22, 2014 at 09:12:38PM +0200, Frans Klaver wrote:
> The rfkill notifier node names are used in three different places. As a
> matter of style, it is better to store them somewhere and have the
> compiler warn us about typos in the function arguments.
> 
> Signed-off-by: Frans Klaver <fransklaver@gmail.com>
> ---
>  drivers/platform/x86/eeepc-laptop.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
> index 6e3be01..e92ea41 100644
> --- a/drivers/platform/x86/eeepc-laptop.c
> +++ b/drivers/platform/x86/eeepc-laptop.c
> @@ -819,11 +819,15 @@ static int eeepc_new_rfkill(struct eeepc_laptop *eeepc,
>  	return 0;
>  }
>  
> +static char EEEPC_RFKILL_NODE_1[] = "\\_SB.PCI0.P0P5";
> +static char EEEPC_RFKILL_NODE_2[] = "\\_SB.PCI0.P0P6";
> +static char EEEPC_RFKILL_NODE_3[] = "\\_SB.PCI0.P0P7";

So, out of curiosity, any particular reason for static char[] instead of
#define? I see both used frequently and didn't see any advice in CodingStyle.

Regardless, Queued and thanks,

-- 
Darren Hart
Intel Open Source Technology Center
