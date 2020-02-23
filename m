From: Kristian Klausen <kristian@klausen.dk>
Subject: Re: [PATCH] platform/x86: asus-wmi: Support laptops where the first
 battery is named BATT
Date: Sun, 23 Feb 2020 19:21:55 +0100
Message-ID: <8a571c5c-abd4-6142-a65a-336f712e4063@klausen.dk>
References: <20200223175424.15613-1-kristian@klausen.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200223175424.15613-1-kristian@klausen.dk>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 23.02.2020 18.54, Kristian Klausen wrote:
> The WMI method to set the charge threshold does not provide a
> way to specific a battery, so we assume it is the first/primary
> battery (by checking if the name is BAT0).
> On some newer ASUS laptops (Zenbook UM431DA) though, the
> primary/first battery isn't named BAT0 but BATT, so we need
> to support that case.
>
> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> Cc: stable@vger.kernel.org
> ---

The patch has been superseded by a new patch with a mirror style change.

> I'm not sure if this is candidate for -stable, it fix a real bug
> (charge threshold doesn't work on newer ASUS laptops) which has been
> reported by a user[1], but is that enough?
> I had a quick look at[2], can this be considered a "something
> critical"? It "bothers people"[1]. My point: I'm not sure..
>
> I'm unsure if there is a bettery way to fix this. Maybe a counter
> would be better (+1 for every new battery)? It would probably need
> to be atomic to prevent race condition (I'm not sure how this code
> is run), but this "fix" is way simpler.
>
> Please do not accept this patch just yet, I'm waiting for the tester
> to either confirm or deny credit[3].
>
> [1] https://gist.github.com/klausenbusk/643f15320ae8997427155c38be13e445#gistcomment-3186025
> [2] https://www.kernel.org/doc/html/v5.5/process/stable-kernel-rules.html
> [3] https://gist.github.com/klausenbusk/643f15320ae8997427155c38be13e445#gistcomment-3186429
>
>   drivers/platform/x86/asus-wmi.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 612ef5526226..4c690cebdd55 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -426,8 +426,11 @@ static int asus_wmi_battery_add(struct power_supply *battery)
>   {
>   	/* The WMI method does not provide a way to specific a battery, so we
>   	 * just assume it is the first battery.
> +	 * Note: On some newer ASUS laptops (Zenbook UM431DA), the primary/first
> +	 * battery is named BATT.
>   	 */
> -	if (strcmp(battery->desc->name, "BAT0") != 0)
> +	if (strcmp(battery->desc->name, "BAT0") != 0
> +	&& (strcmp(battery->desc->name, "BATT") != 0))
>   		return -ENODEV;
>   
>   	if (device_create_file(&battery->dev,
