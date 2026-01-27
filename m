Received: from m.foxido.dev (m.foxido.dev [81.177.217.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0223E354AF7;
	Tue, 27 Jan 2026 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.177.217.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769521862; cv=none; b=GYcQD7PqNBZFycBeTKHRCgn2zjPr0uOxBhtXmKsUwUO/KBOeRMPY+7Vaa76iBJ2i22BulhF1jPX9nXr9MIAVTnNozSu6e+INGIRZNWdVoFEzx6mGZMYUQcDAbGQZL5630AUxRdfwb9+Sr0IOXk4q0FUUy41d9FfTA2qJ0vmqIw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769521862; c=relaxed/simple;
	bh=MwU2ZwhubluO+lpQVkc66qxOkB7B6SyGDlFHP+HlsAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMkeIbte1Nwitv78fDDO346Z9yONycxhPA3jS8qGh7BSMq146ZBStVm/1PSsT0Y0DQ8JipMqnCiNBCguyJ0KaFZ5AszNmMm5UIYjOQp5YKZPSTGy4Fhm3LR0azrgaVOtSPkeu7OFrAssJWv0m2koJViQMZMMtUPgsopbfWnXUsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=foxido.dev; spf=pass smtp.mailfrom=foxido.dev; dkim=pass (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=UaceCBMX; dkim=permerror (0-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=GAQRVtJK; arc=none smtp.client-ip=81.177.217.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=foxido.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxido.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="UaceCBMX";
	dkim=permerror (0-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="GAQRVtJK"
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=foxido.dev; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1769521851; bh=/n2R9sWTkPxsh1veowvC1Vg
	qxbXxLfRmmspBoymhIhM=; b=UaceCBMXY6OijGNcbH/ugkYme3vkWRW7sgoakBgI09uBa3Z2HD
	0bmts/TxGsWvvneHKyDYgvjnT9j0mZaKhOt18nNACcZj9sfKO20Ne5+NCmfBVL421njTr5tzd0W
	jpFS2vZID1b9UcjltL9MabPSKNjdbmQ8voIwA5ZLrrV+OSHkAetgCZumrfjIhAjaV85hVTIn7Hw
	hPAM6TPg1BtpnLLx6MmnfF2vw7brMg/REmqc8BtBFpQflw2JRYlAR6eR+BlX1R+PbNLBpIPVnjV
	9GixbIST9FC9PCGMcsTLL3c1p5Sgd+4uG7GGUI5cHBjzkaVy6CoVzPNEhSlew8JHUeg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=foxido.dev; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1769521851; bh=/n2R9sWTkPxsh1veowvC1Vg
	qxbXxLfRmmspBoymhIhM=; b=GAQRVtJKFOMDGEytHa3gLk8dntypRA3b0kHCf+YoDXuMnoNZE6
	Vu2M9zh3khzdhfEtK7LwG8FJ4N9aU7ZtdFAg==;
Message-ID: <e0d6c973-7b00-48e6-bad6-f592b6e37a61@foxido.dev>
Date: Tue, 27 Jan 2026 16:50:50 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: redmi-wmi: Add more hotkey mappings
To: Jesse Guo <JesseGuoTech@outlook.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TYCPR01MB6851636256C39B170F2312E5D192A@TYCPR01MB6851.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gladyshev Ilya <foxido@foxido.dev>
In-Reply-To: <TYCPR01MB6851636256C39B170F2312E5D192A@TYCPR01MB6851.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/25/26 23:48, Jesse Guo wrote:
> This patch adds more Fn hotkeys (like Refresh rate toggle).
> Additionally, remap the setup key from KEY_SETUP to KEY_CONFIG.
> As KEY_CONFIG is supported by Desktop Environments for launching
> system settings, whereas KEY_SETUP is often ignored by userspace.
> 
> Signed-off-by: Jesse Guo <JesseGuoTech@outlook.com>
> ---
> Changes in v2:
> - Dropped Fn Lock (KEY_FN_ESC) mapping to avoid potential user confusion.
> - The Fn Lock state is handled internally by the EC and does not require
>    a dedicated key event. (Suggested by Gladyshev Ilya)
> - Link to v1: https://lore.kernel.org/r/20260125-redmi-wmi-hotkey-add-v1-1-d3e28568dd75@outlook.com
> ---
>   drivers/platform/x86/redmi-wmi.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
> index 949236b93a321a943a9cb8b0528d730dbaa2cd6f..e5cb348e3a39a3e17abe6b729c79a9f3220eebd6 100644
> --- a/drivers/platform/x86/redmi-wmi.c
> +++ b/drivers/platform/x86/redmi-wmi.c
> @@ -20,7 +20,10 @@
>   static const struct key_entry redmi_wmi_keymap[] = {
>   	{KE_KEY, 0x00000201,	{KEY_SELECTIVE_SCREENSHOT}},
>   	{KE_KEY, 0x00000301,	{KEY_ALL_APPLICATIONS}},
> -	{KE_KEY, 0x00001b01,	{KEY_SETUP}},
> +	{KE_KEY, 0x00001b01,	{KEY_CONFIG}},
> +	{KE_KEY, 0x00011b01,	{KEY_CONFIG}},
> +	{KE_KEY, 0x00010101,	{KEY_SWITCHVIDEOMODE}},
> +	{KE_KEY, 0x00001a01,	{KEY_REFRESH_RATE_TOGGLE}},
>   
>   	/* AI button has code for each position */
>   	{KE_KEY, 0x00011801,	{KEY_ASSISTANT}},
> @@ -32,6 +35,26 @@ static const struct key_entry redmi_wmi_keymap[] = {
>   	{KE_IGNORE, 0x00050501, {}},
>   	{KE_IGNORE, 0x000a0501, {}},
>   
> +	/* Xiaomi G Command Center */
> +	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
> +
> +	/* OEM preset power mode */
> +	{KE_IGNORE, 0x00011601, {}},
> +	{KE_IGNORE, 0x00021601, {}},
> +	{KE_IGNORE, 0x00031601, {}},
> +	{KE_IGNORE, 0x00041601, {}},
> +
> +	/* Fn Lock state */
> +	{KE_IGNORE, 0x00000701, {}},
> +	{KE_IGNORE, 0x00010701, {}},
> +
> +	/* Fn+`/1/2/3/4 */
> +	{KE_KEY, 0x00011101, {KEY_F13}},
> +	{KE_KEY, 0x00011201, {KEY_F14}},
> +	{KE_KEY, 0x00011301, {KEY_F15}},
> +	{KE_KEY, 0x00011401, {KEY_F16}},
> +	{KE_KEY, 0x00011501, {KEY_F17}},
> +
>   	{KE_END}
>   };
>   

LGTM

Reviewed-by: Gladyshev Ilya <foxido@foxido.dev>

> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260125-redmi-wmi-hotkey-add-666af84b0eeb
> 
> Best regards,

