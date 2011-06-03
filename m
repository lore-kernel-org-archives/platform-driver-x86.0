From: Greg Dietsche <gregory.dietsche@cuw.edu>
Subject: Re: [PATCH] sony-laptop: remove unused local variables
Date: Thu, 02 Jun 2011 21:46:00 -0500
Message-ID: <4DE84AE8.60109@cuw.edu>
References: <1307068040-2918-1-git-send-email-Gregory.Dietsche@cuw.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1307068040-2918-1-git-send-email-Gregory.Dietsche@cuw.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Cc: malattia@linux.it, mjg@redhat.com, kernel-janitors@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

please disregard... i neglected to rebase before sending. this patch no 
longer applies to the mainline.

Greg

On 06/02/2011 09:27 PM, Greg Dietsche wrote:
> Removed two unused instances of "handle" local variable.
>
> Signed-off-by: Greg Dietsche<Gregory.Dietsche@cuw.edu>
> ---
>   drivers/platform/x86/sony-laptop.c |    2 --
>   1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 6fe8cd6..9a2c319 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -961,7 +961,6 @@ static int sony_backlight_get_brightness(struct backlight_device *bd)
>   static int sony_nc_get_brightness_ng(struct backlight_device *bd)
>   {
>   	int result;
> -	int *handle = (int *)bl_get_data(bd);
>   	struct sony_backlight_props *sdev =
>   		(struct sony_backlight_props *)bl_get_data(bd);
>
> @@ -973,7 +972,6 @@ static int sony_nc_get_brightness_ng(struct backlight_device *bd)
>   static int sony_nc_update_status_ng(struct backlight_device *bd)
>   {
>   	int value, result;
> -	int *handle = (int *)bl_get_data(bd);
>   	struct sony_backlight_props *sdev =
>   		(struct sony_backlight_props *)bl_get_data(bd);
>
>    
