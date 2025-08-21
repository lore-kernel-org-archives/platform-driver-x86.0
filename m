Received: from mail03.loswebos.de (mail03.loswebos.de [213.187.93.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A59C3054E4
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Aug 2025 17:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.187.93.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755797548; cv=none; b=fMU4yWC2F2ED+3VLOhRTM+Lju3sJIZfxMO3M4SO/Ac/D+XhaTkBEV83Q3eIMU7u+a14Dr62bAhWVHMr5rlX7XNNouVbef754sjOnJQc78byQ/l/t9QVnMoT30TUz3Cq5BVa69sDBJDtZgEfXay2ZOfc48B9vpfdJc7O8g3HRO1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755797548; c=relaxed/simple;
	bh=dET0RahKY9/XUjw7JdQ3yhiGDltX89FRlxqo8MWiLXQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=HZztBodMr2qgAlacrnxzqLtloNXoGMmxAFPTnF+wNVrVojJrA6w9AmFbjCLeW0JW1WIkNMbzbOhv5mcf6pEsrsKFvPHUY1UH4e72Q6Hup+hcddDrqzwzorcXYakCatDs6JKNyvbWNZ0JKJepEg6npGaqT4fUqg4GI8G+QM7jaI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protoco.consulting; spf=pass smtp.mailfrom=protoco.consulting; dkim=fail (0-bit key) header.d=protoco.consulting header.i=@protoco.consulting header.b=CvOWZ1kz reason="key not found in DNS"; arc=none smtp.client-ip=213.187.93.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protoco.consulting
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protoco.consulting
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=protoco.consulting header.i=@protoco.consulting header.b="CvOWZ1kz"
Received: from mail-proxy-01.loswebos.de (mail-proxy01.loswebos.de [213.187.93.160])
	by mail03.loswebos.de (Postfix) with ESMTPSA id 8C5381B2CF;
	Thu, 21 Aug 2025 19:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=protoco.consulting;
	s=protoco-consulting; t=1755797535;
	bh=dET0RahKY9/XUjw7JdQ3yhiGDltX89FRlxqo8MWiLXQ=;
	h=Date:From:To:Cc:Subject:Reply-To:In-Reply-To:References;
	b=CvOWZ1kznn5O5KKrHyQlZymViW03a0a8M0pV1Iv073y2SQSrMo2L1c4WwvmiVKvRj
	 t2Xhdy0nZ26PG4GmRyFQGNo3896vM9gY2QZxemR8RJSF+WLsoActe8HLDlVszbowaT
	 QidBn/yIG86iC4d01w29qpODqlFOTByWISVYEiW4zcBs7t9sxFLZEQvTR58eHJkths
	 SSaMG/OPYHRQsmC5LaSJryzcYL6K27D01mjFPGAByeEMJvy1k2WgKWgOy2Pnuz15cN
	 GKRnRBviML8mWjxw1DgUgLL0UkszHeaFiYxE8zfH/M7jENGH4rY+nREE69LU5EIdlG
	 qsUaYnhzbEqTQ==
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 21 Aug 2025 17:32:14 +0000
From: Marc Burkhardt <marc.burkhardt@protoco.consulting>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh
 <hmh@hmh.eng.br>, "Derek J . Clark" <derekjohn.clark@gmail.com>, Hans de
 Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH v1] platform/x86: thinkpad_acpi: Add parameter to
 suppress invalid thermal sensors
Reply-To: marc.burkhardt@protoco.consulting
Mail-Reply-To: marc.burkhardt@protoco.consulting
In-Reply-To: <196b8004-3b09-48d4-891a-80eee2efbf3c@app.fastmail.com>
References: <20250818204353.857304-1-marc.burkhardt@protoco.consulting>
 <196b8004-3b09-48d4-891a-80eee2efbf3c@app.fastmail.com>
Message-ID: <ebaa2ff317a21291a086a55b204d2d68@protoco.consulting>
X-Sender: marc.burkhardt@protoco.consulting
Organization: protoco consulting
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Am 2025-08-20 00:03, schrieb Mark Pearson:

Hi Mark,

thanks for replying.

> Hi Marc,
> 
> On Mon, Aug 18, 2025, at 4:39 PM, Marc Burkhardt wrote:
>> While moving an existing Icinga installation to a Lenovo P15 20SU I 
>> came
>> across broken JSON output from a "sensors -Aj" command consumed by the
>> Icinga check_lm_sensors plugin. After fiddling around trying to build 
>> a
>> fix in either lm_sensors or Icinga I found out the error was rooted in
>> some sysfs file that was created but threw errors while being read. On 
>> my
>> Lenovo ThinkPad the default fallback to 8 temperature sensors creates
>> sysfs entries like in my case "temp8_input" that fail when read, 
>> causing
>> the issue in user-space.
>> 
>> This patch adds a module parameter (suppress_sensor) using
>> module_param_array() to allow users to specify a comma-separated list 
>> of
>> zero-based sensor indices to suppress sysfs file creation (e.g.
>> suppress_sensor=3,7). Instead of a model-specific quirk, this provides
>> flexible configuration for any ThinkPad with similar issues and is 
>> working
>> out-of-the-box without additional models being marked for the quirk. 
>> The
>> parameter uses a fixed-size array based on TPACPI_MAX_THERMAL_SENSORS 
>> (16)
>> consistent with the driver’s thermal sensor handling (ie.
>> ibm_thermal_sensors_struct or sensor_dev_attr_thermal_temp_input).
>> 
>> Logging via pr_info() reports the number of suppressed sensors at 
>> module
>> initialization, and pr_info() logs each suppressed sensor during sysfs
>> attribute creation. Invalid sensor indices are logged once via 
>> pr_warn()
>> to avoid repetitive warnings. Tested on a ThinkPad P15 with
>> suppress_sensor=3,7, confirming suppression of temp4_input and 
>> temp8_input
>> with no sysfs errors. Bounds checking for uncommon values is in place 
>> or
>> will be logged.
>> 
>> The patch applies to the current
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
>> although
>> it was initially written for a 6.16.0 kernel.
>> 
>> I look forward to any feedback on the patch and/or handling of 
>> submission.
>> Please CC: for now as I am not (yet) subscribed. Thank you.
>> 
>> Signed-off-by: Marc Burkhardt <marc.burkhardt@protoco.consulting>
>> ---
>> Notes:
>> I haven't posted on LKML or send a patch for over a decade now so
>> please forgive any possible mistakes I made regarding current coding
>> conventions or more generally in submitting this patch. The patch was
>> running for some time here with faulty sensors removed from sysfs and 
>> no
>> problems otherwise detected and was surely run through checkpatch.pl 
>> before
>> submission. get_maintainer.pl was helpful to find the hopefully right
>> people for CC:ing but I am otherweise totally unaware of any current
>> procedures or best-practices when it comes to submitting a patch.
>> 
>> drivers/platform/x86/lenovo/thinkpad_acpi.c | 35 
>> +++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>> 
>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> index cc19fe520ea9..30ff01f87403 100644
>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> @@ -6019,6 +6019,30 @@ struct ibm_thermal_sensors_struct {
>>  	s32 temp[TPACPI_MAX_THERMAL_SENSORS];
>>  };
>> 
>> +static int suppress_sensor[TPACPI_MAX_THERMAL_SENSORS];
>> +static unsigned int suppress_sensor_count;
>> +
>> +static bool is_sensor_suppressed(int index)
>> +{
>> +	unsigned int i;
>> +	bool logged = false;
>> +
>> +	for (i = 0; i < suppress_sensor_count; i++) {
>> +		if (suppress_sensor[i] == index)
>> +			return true;
>> +
>> +		if (!logged &&
>> +			(suppress_sensor[i] < 0
>> +				|| suppress_sensor[i] >= TPACPI_MAX_THERMAL_SENSORS)) {
>> +			pr_warn("Invalid sensor index %d in suppress_sensor\n",
>> +				suppress_sensor[i]);
>> +			logged = true;
>> +		}
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>  static const struct tpacpi_quirk thermal_quirk_table[] __initconst = 
>> {
>>  	/* Non-standard address for thermal registers on some ThinkPads */
>>  	TPACPI_Q_LNV3('R', '1', 'F', true),	/* L13 Yoga Gen 2 */
>> @@ -6313,6 +6337,11 @@ static umode_t thermal_attr_is_visible(struct
>> kobject *kobj,
>> 
>>  	int idx = sensor_attr->index;
>> 
>> +	if (is_sensor_suppressed(idx)) {
>> +		pr_info("Sensor %d suppressed\n", idx);
>> +		return 0;
>> +	}
>> +
>>  	switch (thermal_read_mode) {
>>  	case TPACPI_THERMAL_NONE:
>>  		return 0;
>> @@ -11653,6 +11682,9 @@ static void __init
>> thinkpad_acpi_init_banner(void)
>>  			thinkpad_id.model_str,
>>  			(thinkpad_id.nummodel_str) ?
>>  				thinkpad_id.nummodel_str : "unknown");
>> +
>> +	pr_info("Suppressing %d user-supplied sensor(s) via parameter
>> suppress_sensor\n",
>> +		suppress_sensor_count);
>>  }
>> 
>>  /* Module init, exit, parameters */
>> @@ -11785,6 +11817,9 @@ MODULE_PARM_DESC(experimental,
>>  module_param_named(debug, dbg_level, uint, 0);
>>  MODULE_PARM_DESC(debug, "Sets debug level bit-mask");
>> 
>> +module_param_array(suppress_sensor, int, &suppress_sensor_count, 
>> 0444);
>> +MODULE_PARM_DESC(suppress_sensor, "Comma-separated sensor indices to
>> suppress (e.g., 3,7)");
>> +
>>  module_param(force_load, bool, 0444);
>>  MODULE_PARM_DESC(force_load,
>>  		 "Attempts to load the driver even on a mis-identified ThinkPad 
>> when
>> true");
> 
> The P15 is one of the Linux certified platforms...though it's a bit 
> older now.
> 
> I'd be more interested in figuring out which sensors are returning an 
> error and figuring out how we address that. I have access to the FW and 
> platform team for questions (though this platform is a bit older now, 
> so if we need FW fixes that will be trickier). My gut feeling is we 
> shouldn't be creating sysfs entries if the sensors don't exist or 
> aren't accessible.

That is what my patch does - it prevents creating the sysfs entries but 
not based on a check for validity of the sensor in code (as probably 
desired by Ilpo when I understand a previous mail correctly) but rather 
on a user-provided configuration via the new parameter. I reply to the 
other mail as well soon.

> 
> I do have a P15 so can check it out (I'm going to have to blow some 
> dust off it). If you've got the details on which sensors need 
> suppressing that would be useful. I have seen previously where it's 
> trying to access a GPU sensor on a UMA model.

On my hardware it's sensor temp8_input which is unreadable at all und 
sensor temp4_input that has a constant value of 0, no matter how hot, 
cold or loud the machine is running. I am, however, able to monitor GPU 
temps via nvidia _and_ thinkpad ACPI. The values are mostly equal, 
differ a bit due to internal timing sometimes.

> 
> Mark

Marc
