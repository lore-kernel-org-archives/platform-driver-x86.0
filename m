From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 3/4] platform/x86: fujitsu-laptop: break up complex loop
 condition
Date: Fri, 13 Jan 2017 23:08:47 +1030
Message-ID: <20170113123847.GE9036@marvin.atrad.com.au>
References: <20170111085933.2486-1-kernel@kempniu.pl>
 <20170111085933.2486-4-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170111085933.2486-4-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 11, 2017 at 09:59:32AM +0100, Micha?? K??pie?? wrote:
> The loop condition in acpi_fujitsu_hotkey_release() includes an
> assignment, a four-argument function call and a comparison, making it
> hard to read.  Separate the assignment from the comparison to improve
> readability.
> 
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>

Acked-by: Jonathan Woithe <jwoithe@just42.net>

> ---
>  drivers/platform/x86/fujitsu-laptop.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index e57d3724d2ce..06653a8594ed 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -1054,11 +1054,13 @@ static void acpi_fujitsu_hotkey_release(void)
>  	struct input_dev *input = fujitsu_hotkey->input;
>  	int keycode, status;
>  
> -	while ((status = kfifo_out_locked(&fujitsu_hotkey->fifo,
> +	while (true) {
> +		status = kfifo_out_locked(&fujitsu_hotkey->fifo,
>  					  (unsigned char *)&keycode,
>  					  sizeof(keycode),
> -					  &fujitsu_hotkey->fifo_lock))
> -					  == sizeof(keycode)) {
> +					  &fujitsu_hotkey->fifo_lock);
> +		if (status != sizeof(keycode))
> +			return;
>  		input_report_key(input, keycode, 0);
>  		input_sync(input);
>  		vdbg_printk(FUJLAPTOP_DBG_TRACE,
> -- 
> 2.11.0

-- 
