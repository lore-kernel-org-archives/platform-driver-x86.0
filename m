Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554641F1315;
	Tue, 10 Feb 2026 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730272; cv=none; b=DjZzu3gToSVMrkxEeCvm3GRvf9mS6jWhrA7TGNcHZv/fcRVI24r5ETF5fJBGgOqR5Tt3bdfvWeSjBbuppq23i/mLyzlvHCHBFc81E9QJCVrJaaRl0RxkqMuT0dZZICRtayy5bCrIpsjQeV9FZ83wkhI8BkLxDr2tkmM4OBPIT2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730272; c=relaxed/simple;
	bh=Eomouwv6oYSf9T16BtpjQNPgfu8CptfxGVHEV0Xip/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7aOrnl9gKUJsj77R9MKHOt4WtL2JNu9hi7kd8DRPbzU+wtPqHkanhN6s0bU/og78yV4T4aaOx6BJ6sNXehcSc2FzZW8KzvuhIR1amz5fmPxuSLPz9lNFDExBzIJuLYqwwVhwa9XcTEaTMXTIHGS98NY/4aEsG5uhCQW4nwSh5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uE1acRbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uE1acRbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C58C116C6;
	Tue, 10 Feb 2026 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770730271;
	bh=Eomouwv6oYSf9T16BtpjQNPgfu8CptfxGVHEV0Xip/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uE1acRbHoo7Tf2ML2ADrOEVo4Qw77GOYlfIscKl47Rwp0TtqtsX9aJmND7HRqOOvs
	 C9uCsZ9dMQ0pIkfTRBIdoO8r/9u6KBnvVin67kuWBElYsBVrOj1xswRTygyPFT6hhE
	 axJF4HG3M/iW9SWExw5cTKxUqKYsZzZ6wmGzAac56O6lz110bUZa72it/geNEF19/d
	 zZumqxszWyWueu1BQJJQvePjUBqfjaRPoefkDvKHq+b4y4bBQA7FK5KMUIu1QQRXJ/
	 qOGX1l2GxWoJXiEWycLKy42EkXTBErw1Qr2Rd+jg3MwdlHn+Prk3wPaCorkmrujCFM
	 rQkbwgPg3c8LA==
Message-ID: <068af0f9-596d-4c74-af64-b99062ff8f76@kernel.org>
Date: Tue, 10 Feb 2026 14:31:08 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: int3472: Handle GPIO type 0x10 (DOVDD)
To: Leif Skunberg <diamondback@cohunt.app>, dan.scally@ideasonboard.com,
 sakari.ailus@linux.intel.com
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260210085615.34257-1-diamondback@cohunt.app>
 <20260210132129.17943-1-diamondback@cohunt.app>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260210132129.17943-1-diamondback@cohunt.app>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-Feb-26 14:21, Leif Skunberg wrote:
> The Lenovo ThinkPad X1 Fold 16 Gen 1 has an OV5675 sensor (ACPI HID
> OVTI5675) behind an INT3472 discrete PMIC controller. The INT3472
> _DSM returns GPIO type 0x10 for one of the pins, which controls the
> DOVDD (digital I/O power) regulator enable.
> 
> Type 0x10 is not currently handled by the driver, causing the GPIO to
> be ignored with a warning. Add INT3472_GPIO_TYPE_DOVDD (0x10) and
> handle it as a regulator with con_id "dovdd" to match the supply name
> used by sensor drivers (e.g. ov5675).
> 
> Also increase GPIO_SUPPLY_NAME_LENGTH from 5 to 6 to accommodate
> the "dovdd" name (5 chars + null terminator).
> 
> Signed-off-by: Leif Skunberg <diamondback@cohunt.app>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 7 +++++++
>  include/linux/platform_data/x86/int3472.h     | 5 +++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 1505fc3ef..fec8a899c 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -223,6 +223,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  		*con_id = "avdd";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_DOVDD:
> +		*con_id = "dovdd";
> +		*gpio_flags = GPIO_ACTIVE_HIGH;
> +		break;
>  	case INT3472_GPIO_TYPE_HANDSHAKE:
>  		*con_id = "dvdd";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> @@ -251,6 +255,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>   * 0x0b Power enable
>   * 0x0c Clock enable
>   * 0x0d Privacy LED
> + * 0x10 DOVDD (digital I/O voltage)
>   * 0x13 Hotplug detect
>   *
>   * There are some known platform specific quirks where that does not quite
> @@ -332,6 +337,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	case INT3472_GPIO_TYPE_CLK_ENABLE:
>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
> +	case INT3472_GPIO_TYPE_DOVDD:
>  	case INT3472_GPIO_TYPE_HANDSHAKE:
>  		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
>  		if (IS_ERR(gpio)) {
> @@ -356,6 +362,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  		case INT3472_GPIO_TYPE_POWER_ENABLE:
>  			second_sensor = int3472->quirks.avdd_second_sensor;
>  			fallthrough;
> +		case INT3472_GPIO_TYPE_DOVDD:
>  		case INT3472_GPIO_TYPE_HANDSHAKE:
>  			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
>  							     con_id, second_sensor);
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index b1b837583..dbe745dc8 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -26,6 +26,7 @@
>  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> +#define INT3472_GPIO_TYPE_DOVDD					0x10
>  #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
>  #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
>  
> @@ -33,8 +34,8 @@
>  #define INT3472_MAX_SENSOR_GPIOS				3
>  #define INT3472_MAX_REGULATORS					3
>  
> -/* E.g. "avdd\0" */
> -#define GPIO_SUPPLY_NAME_LENGTH				5
> +/* E.g. "dovdd\0" */
> +#define GPIO_SUPPLY_NAME_LENGTH				6
>  /* 12 chars for acpi_dev_name() + "-", e.g. "ABCD1234:00-" */
>  #define GPIO_REGULATOR_NAME_LENGTH				(12 + GPIO_SUPPLY_NAME_LENGTH)
>  /* lower- and upper-case mapping */

