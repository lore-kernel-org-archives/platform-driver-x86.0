Received: from mail03.loswebos.de (mail03.loswebos.de [213.187.93.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52311482FF
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Aug 2025 17:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.187.93.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755798468; cv=none; b=c4CLlJCR924BK/pv4LZo1cprzZDJCtjhdZkUAFJIafQ8i7F0aD0ZxstlOood4Kp3kUUAo9pwO0Qr5ghkUBvB47FAfwITi1mRMOuDeWfTjFLFpyFp3RoLzmhnCOJX7Wpxr82nvWYXaU016ZcFO+zKKVwwOWDLyNBKM4aemYYiNJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755798468; c=relaxed/simple;
	bh=fv1nVIM81c2ZshjU91BY/Ccjt1kDDeumlbbgrJHzMck=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=G03jWe7eE2fBN1VisUkfNBwtbz3jKgLyt8NkaYS8fHcw8c+3GrfaV2DBdCvX/TtXKjAhF5eAbxQng1SFo0NbBDQtoaSM9k5276OOq/aLtbz8ZKK8GExCZuxbMz6CS6pyutWGWEPxsghBQ4CeySRwoRxOfnkQHmUPyYOY9Ve8iSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protoco.consulting; spf=pass smtp.mailfrom=protoco.consulting; dkim=fail (0-bit key) header.d=protoco.consulting header.i=@protoco.consulting header.b=V03YHlew reason="key not found in DNS"; arc=none smtp.client-ip=213.187.93.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protoco.consulting
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protoco.consulting
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=protoco.consulting header.i=@protoco.consulting header.b="V03YHlew"
Received: from mail-proxy-01.loswebos.de (mail-proxy01.loswebos.de [213.187.93.160])
	by mail03.loswebos.de (Postfix) with ESMTPSA id 384D91B2E8;
	Thu, 21 Aug 2025 19:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=protoco.consulting;
	s=protoco-consulting; t=1755798463;
	bh=fv1nVIM81c2ZshjU91BY/Ccjt1kDDeumlbbgrJHzMck=;
	h=Date:From:To:Cc:Subject:Reply-To:In-Reply-To:References;
	b=V03YHlewiHN+ccq0B42b71Do+StwCHInClULGNsbE5hsYyC8/bsaN57mWJoZcXPI7
	 AtaJCZzAwUYEpfrFqYC2a+9VZpe02R+I5bO91T0h/kKBerJKly00K69tFqGbEdfoj7
	 shYu0itbi1I7xzqWfbS/CkUmD1rB1mejdrpCvGhhKez1kpAPTqy/50PN71mMgPE0/1
	 T4Hn5q+g+0/XVuAl8lGKQdV83n9q6TUQZtOz3yzXlXptZfJdaDUaSJ0VP0QOn+Zrs6
	 Cy7jCDuTDygZXwTS8j36Op7udyy49vd5HeeU3iWBUu5DDAz6HiIh/x6vRILIDgqHET
	 LIP7zVaWe/pvw==
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 21 Aug 2025 17:47:43 +0000
From: Marc Burkhardt <marc.burkhardt@protoco.consulting>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, "Derek J. Clark"
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>
Subject: Re: [RFC PATCH v1] platform/x86: thinkpad_acpi: Add parameter to
 suppress invalid thermal sensors
Reply-To: marc.burkhardt@protoco.consulting
Mail-Reply-To: marc.burkhardt@protoco.consulting
In-Reply-To: <5a10e50a-ba06-e326-0643-73135709c8a3@linux.intel.com>
References: <20250818204353.857304-1-marc.burkhardt@protoco.consulting>
 <5a10e50a-ba06-e326-0643-73135709c8a3@linux.intel.com>
Message-ID: <864df0dfcb93d3b8985d9a4b18cf8d71@protoco.consulting>
X-Sender: marc.burkhardt@protoco.consulting
Organization: protoco consulting
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Ilpo,

below find my probably (a bit) lengthy feedback to your mail and excuse 
the delay in replying.

Am 2025-08-19 08:05, schrieb Ilpo Järvinen:
> On Mon, 18 Aug 2025, Marc Burkhardt wrote:
> 
>> While moving an existing Icinga installation to a Lenovo P15 20SU I 
>> came
>> across broken JSON output from a "sensors -Aj" command consumed by the
> 
> The commit message is not meant to be a history lesson about how the 
> patch
> came to be but to describe the problem seen and how patch is fixing it.
> Please try to state imperatively what is the problem, not "I did x" 
> kind
> of sentences. E.g.,
> 
> "sensors -Aj" JSON output on Lenovo P15 20SU is broken because ...
> 
> Also try to avoid using "This patch" to start a sentence.
> 
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
> 
> Can't we determine this at probe time automatically?
> 
> We generally try to avoid module parameters whenever possible. 
> Sometimes,
> if not automated way exists, quirk + a parameter intended for temporary
> use might be acceptable compromise. I don't understand why you say
> "additional models being marked for the quirk" as that seems never
> necessary even if a quirk exists.
> 
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
>> to avoid repetitive warnings.
> 
> This logging likely needs work too (to print much less), but lets first
> agree with the way forward.

I can reduce the logging going from pr_info to pr_debug or just remove 
it
as a whole for sure. But as I thought that this is an end-user thing 
(given it
is a ThinkPad) I put it there on purpose to let the user know what was 
going
on. The message about the de-facto suppressed sensors just logs once per
provided sensor index on sysfs creation, not the sensor's usage. The
thinkpad_acpi module, moreover, logs excessively in general already. 
Just saw
this from a user's perspective seeing myself google forum posts for 
missing
sensors without a trace. I can surely make the logging conditional in
thinkpad_acpi_init_banner().

That user-thinking was also part my second thought: as I didn't find any 
such
problem for a P15 on Google or the like I suspected this to be a 
not-so-usual case. Thus,
I have already re-worked the patch to its current form using a parameter
instead of using a quirk-table (analog to the ones already in place) 
that I had
written initially (using BIOS revision N30) as this would mean
suppressing the sensor on any such device without knowing if the problem
_really_ exists on the device in general in the real world - I haven't 
found any such
report on the Net while searching for it so I _assume_ that this is a 
weird
edge-case we're talking about here that the sensor is non-functional or 
my
hardware is borked in some way for whatever reason. The rather static 
creation
of let's say 8 or 16 sensors in general _could_ probably be the problem. 
The code
seems to make 16 iterations on my device as I saw when I had debug log 
in place,
probably due to the static size of TPACPI_MAX_THERMAL_SENSORS;

Also I imagine there will be other ThinkPad-devices/models having such
problem with a different sensor index (which I surely don't
know of yet) so these would not be listed in the new quirk-table and 
needed a new
patch to include them valid for this quirk. It might be another model 
needs a
quirk for sensor 14, 15 and 16 which the current code would just create 
if the
device falls through a specific match (not validating the actual 
sensors) as the
sensors creation currently is rather "static". Using the parameter a 
user would be
able to just add the index of the broken sensor and would be good to go 
no
matter what model being used and what sensors indices it would affect - 
it's just
my approach to be generic and future proof. The quirk-table approach 
also used
more code than the parameter approach with even reduced flexibility.

As I understand your mail you would also eventually like testing the 
sensor
being created for let's say "technical validity". On my machine 
temp4_input is
technically valid (sysfs created and working) but spills a static 0. So 
this
sensor is actually unusable from a user-point of view making me exclude 
it via
the new parameter as well. What would (in your opinion) the handling be 
for
this specific sensor temp4_input be when using the quirk-table approach?

Please advice on how to re-write the functionality so I can give it 
another spin.
Sorry for the lengthy explanation and thanks for your time reading this.

> 
>> Tested on a ThinkPad P15 with
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
> 
> Please don't include details like these 2 last paragraphs into the 
> commit
> message itself, it's fine to state things like this below --- line as
> they're automatically removed when the patch is applied.
> 
> Usually Linus' tree is fine as base, but sometimes pdx86 for-next has
> diverged.
> 
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
> 
> Welcome back. You did quite well regardless. :-)
> 
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
>> when true");
>> 

Marc
