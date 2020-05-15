From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCHv2 5/7] platform/x86: thinkpad_acpi: Use
 input_device_enabled()
Date: Fri, 15 May 2020 14:02:02 -0300
Message-ID: <20200515170202.GA6364@khazad-dum.debian.net>
References: <20200515164943.28480-1-andrzej.p@collabora.com>
 <20200515165227.28859-1-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200515165227.28859-1-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-input@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, kernel@collabora.com
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 15 May 2020, Andrzej Pietrasiewicz wrote:
> Use the new helper. Inspecting input device's 'users' member needs to be
> done under device's mutex, so add appropriate invocations.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 0f704484ae1d..8ae11b8c3ebb 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -2671,9 +2671,10 @@ static void hotkey_poll_setup(const bool may_warn)
>  	const u32 poll_driver_mask = hotkey_driver_mask & hotkey_source_mask;
>  	const u32 poll_user_mask = hotkey_user_mask & hotkey_source_mask;
>  
> +	mutex_lock(&tpacpi_inputdev->mutex);
>  	if (hotkey_poll_freq > 0 &&
>  	    (poll_driver_mask ||
> -	     (poll_user_mask && tpacpi_inputdev->users > 0))) {
> +	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
>  		if (!tpacpi_hotkey_task) {
>  			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
>  					NULL, TPACPI_NVRAM_KTHREAD_NAME);
> @@ -2690,6 +2691,7 @@ static void hotkey_poll_setup(const bool may_warn)
>  				  poll_user_mask, poll_driver_mask);
>  		}
>  	}
> +	mutex_unlock(&tpacpi_inputdev->mutex);
>  }
>  
>  static void hotkey_poll_setup_safe(const bool may_warn)

-- 
  Henrique Holschuh

  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
