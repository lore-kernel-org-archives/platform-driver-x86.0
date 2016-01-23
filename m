From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 700 to no_hw_rfkill dmi
 list
Date: Fri, 22 Jan 2016 23:27:31 -0800
Message-ID: <20160123072731.GI1979@malice.jf.intel.com>
References: <1453145573-15600-1-git-send-email-jwboyer@fedoraproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453145573-15600-1-git-send-email-jwboyer@fedoraproject.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Boyer <jwboyer@fedoraproject.org>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 18, 2016 at 02:32:53PM -0500, Josh Boyer wrote:
> Like the Yoga 900 models the Lenovo Yoga 700 does not have a
> hw rfkill switch, and trying to read the hw rfkill switch through the
> ideapad module causes it to always reported blocking breaking wifi.
> 
> This commit adds the Lenovo Yoga 700 to the no_hw_rfkill dmi list, fixing
> the wifi breakage.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1295272
> Tested-by: <dinyar.rabady+spam@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Josh Boyer <jwboyer@fedoraproject.org>
> ---
> 
> This applies to the for-next branch of the platform-x86-drivers tree
> 
> 
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index d28db0e793df..51178626305d 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -900,6 +900,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>  		},
>  	},
>  	{
> +		.ident = "Lenogo Yoga 700",

Josh,

Is this a typo? "Lenogo"? Please tell me it's a typo.... :-)

-- 
Darren Hart
Intel Open Source Technology Center
