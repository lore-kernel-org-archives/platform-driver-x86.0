Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574EB256D
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 00:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755648244; cv=none; b=qkXfbRy22iKgfQ4rCwafv3qwFMmitB+vF1zfY7hQsZv5uIhTz6Zi3FOSZ8+Dh/+jkRTdHgx+CXjFJpL/gZZoDQT5TZYRu2E0HHoyeEZ/1j5iZy9Hod94cryBGHvs7wwLSU2V1gXLkpuBJPA8HHaFlqxVf1NJ4pu8fQj7f3vpxgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755648244; c=relaxed/simple;
	bh=aQ3ktBvm8tIYHRx/4Vqpwp0cpRmgh3CLvjyqJ2HbyA0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OJ/ynZPVN0Ks2J7Rl+nrpb8HaSFrI+92AWGmMNTFi4HpZ8XsD8BheTq7NPlAnmRVy7mz+O0YQIufpuyyqH1J063FIZo+F+blo3iWx/4O280e2GPJ4fYxKT/pFcHXmOGTBRJQSgzqV/b5g9QgCVxbqQTN/NRw8lIHKbQCOarpVK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=MAqj4r0x; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=irguvTzx; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="MAqj4r0x";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="irguvTzx"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5D5AF14003B1;
	Tue, 19 Aug 2025 20:04:01 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Tue, 19 Aug 2025 20:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1755648241;
	 x=1755734641; bh=C7/xsP6JXaTn1kxkdK4oQA4QKuzCOWwwmlrg9UlnRZM=; b=
	MAqj4r0x5eqIUrzeesC6J4Nh/IkGGJLdMXc1nztoo1OYE64j9ornLHWHt4hQ4vfG
	juWuYwp11ylKZ8tgfXKHUu74Tbl/zfMQkwF9yx5wnjjJUCeIFIRHXyF1NKDu9Gtu
	dS4bcNp5kzl3awBFaWVRBlV2ZNj6x21X5OooCROmuhV2o063PxGdTZ1mplrW0u3D
	YYak3azSmccl1N5zts+sbIMoRwUeJ5nh51uHCG7RFin6BBE3/CoSNmTrkVTO+upF
	hMe7J0nVseP/SSZJ4wCDHXGzCYMnutNAvx1xyDcFsfm7DZR7ppceGN42ZOssMWmJ
	+zxmX3jc7Cu5HwJcwoeVfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755648241; x=
	1755734641; bh=C7/xsP6JXaTn1kxkdK4oQA4QKuzCOWwwmlrg9UlnRZM=; b=i
	rguvTzxntiytSSVIRK2qmEy0beC9nvZHgAvdO+pFr95lyrfxzOR7g2nSj5rxOi44
	KzIp8Xu/KDptfUNMvmTNY0JuXy+8ugwRFY3mUKUAsaD230jrs6KRogh0tD/jSWrp
	4B2K9LVn2flwFSQ/WRgXaY4lsjVE3oCoaCea73pvzQs2uu+PJV6dDZQj/GlfYQVY
	5EKev3vC/g1mOEKYdQ90bbWQ5tkJjfoQvEDjS53dJ/1m+HgeBUfvmC1iPf7IXZ5v
	GPlaqGjFcyZwpCPq/Ah+I919kv8nmNjMKqt0V5YDQI0UCDsM/ihBiwmC8SW0MQgz
	194bYoOhDpr9P5rzgREdQ==
X-ME-Sender: <xms:8BClaGSQYnKUB8aBQerYJXkeOdwe1u3mz_g14nDE8_uvtEx1snvY0Q>
    <xme:8BClaLxu110gwCPwydFMdrZuoVlExsKoprBX5YJr6bNtoTjF2qoHR42R2GQKL24Al
    NqWEnWlNKGrleB0BLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheeikeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpeegvdegueffhfdtleeigfejhffggfeivdejgeelueej
    uedtudetheejudehtdeitdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepjedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkhhjohhhnhdrtghlrghrkhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehhmhhhsehhmhhhrdgvnhhgrdgsrhdprhgtphhtthhope
    hhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhn
    vghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihgsmhdqrggtphhiqd
    guvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtohep
    mhgrrhgtrdgsuhhrkhhhrghrughtsehprhhothhotghordgtohhnshhulhhtihhnghdprh
    gtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:8BClaEi1vQ3pGWiq-PVM9X9TSCAMVapo5xT27u2alqz25HPG4nk9zQ>
    <xmx:8BClaCNuQwFS4qrhmu0EtqgzaBFHY3-gs9lEc8CsGCMueD7cMQMQRQ>
    <xmx:8BClaM9UpeFSxidW7U5dAdu2M9lrFIo9r1Py2cg07h38LXAFIi-pyw>
    <xmx:8BClaLdmLtGtZZn7K3f0vYyVlyWQzCTQ5PJuUOu44DemQUtmIfKEUA>
    <xmx:8RClaKm6dw-Nui_6ah0HDR-qXHAyBujMZvft4lYvmAOqU1vQziHbutpS>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 061DE2CE0071; Tue, 19 Aug 2025 20:04:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AqlvLU1YwUxg
Date: Tue, 19 Aug 2025 20:03:38 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Marc Burkhardt" <marc.burkhardt@protoco.consulting>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-Id: <196b8004-3b09-48d4-891a-80eee2efbf3c@app.fastmail.com>
In-Reply-To: <20250818204353.857304-1-marc.burkhardt@protoco.consulting>
References: <20250818204353.857304-1-marc.burkhardt@protoco.consulting>
Subject: Re: [RFC PATCH v1] platform/x86: thinkpad_acpi: Add parameter to suppress
 invalid thermal sensors
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Marc,

On Mon, Aug 18, 2025, at 4:39 PM, Marc Burkhardt wrote:
> While moving an existing Icinga installation to a Lenovo P15 20SU I ca=
me
> across broken JSON output from a "sensors -Aj" command consumed by the
> Icinga check_lm_sensors plugin. After fiddling around trying to build a
> fix in either lm_sensors or Icinga I found out the error was rooted in
> some sysfs file that was created but threw errors while being read. On=
 my
> Lenovo ThinkPad the default fallback to 8 temperature sensors creates
> sysfs entries like in my case "temp8_input" that fail when read, causi=
ng
> the issue in user-space.
>
> This patch adds a module parameter (suppress_sensor) using
> module_param_array() to allow users to specify a comma-separated list =
of
> zero-based sensor indices to suppress sysfs file creation (e.g.
> suppress_sensor=3D3,7). Instead of a model-specific quirk, this provid=
es
> flexible configuration for any ThinkPad with similar issues and is wor=
king
> out-of-the-box without additional models being marked for the quirk. T=
he
> parameter uses a fixed-size array based on TPACPI_MAX_THERMAL_SENSORS =
(16)
> consistent with the driver=E2=80=99s thermal sensor handling (ie.
> ibm_thermal_sensors_struct or sensor_dev_attr_thermal_temp_input).
>
> Logging via pr_info() reports the number of suppressed sensors at modu=
le
> initialization, and pr_info() logs each suppressed sensor during sysfs
> attribute creation. Invalid sensor indices are logged once via pr_warn=
()
> to avoid repetitive warnings. Tested on a ThinkPad P15 with
> suppress_sensor=3D3,7, confirming suppression of temp4_input and temp8=
_input
> with no sysfs errors. Bounds checking for uncommon values is in place =
or
> will be logged.
>
> The patch applies to the current
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git alt=
hough
> it was initially written for a 6.16.0 kernel.
>
> I look forward to any feedback on the patch and/or handling of submiss=
ion.
> Please CC: for now as I am not (yet) subscribed. Thank you.
>
> Signed-off-by: Marc Burkhardt <marc.burkhardt@protoco.consulting>
> ---
> Notes:
> I haven't posted on LKML or send a patch for over a decade now so
> please forgive any possible mistakes I made regarding current coding
> conventions or more generally in submitting this patch. The patch was
> running for some time here with faulty sensors removed from sysfs and =
no
> problems otherwise detected and was surely run through checkpatch.pl b=
efore
> submission. get_maintainer.pl was helpful to find the hopefully right
> people for CC:ing but I am otherweise totally unaware of any current
> procedures or best-practices when it comes to submitting a patch.
>
> drivers/platform/x86/lenovo/thinkpad_acpi.c | 35 +++++++++++++++++++++=
++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c=20
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index cc19fe520ea9..30ff01f87403 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -6019,6 +6019,30 @@ struct ibm_thermal_sensors_struct {
>  	s32 temp[TPACPI_MAX_THERMAL_SENSORS];
>  };
>=20
> +static int suppress_sensor[TPACPI_MAX_THERMAL_SENSORS];
> +static unsigned int suppress_sensor_count;
> +
> +static bool is_sensor_suppressed(int index)
> +{
> +	unsigned int i;
> +	bool logged =3D false;
> +
> +	for (i =3D 0; i < suppress_sensor_count; i++) {
> +		if (suppress_sensor[i] =3D=3D index)
> +			return true;
> +
> +		if (!logged &&
> +			(suppress_sensor[i] < 0
> +				|| suppress_sensor[i] >=3D TPACPI_MAX_THERMAL_SENSORS)) {
> +			pr_warn("Invalid sensor index %d in suppress_sensor\n",
> +				suppress_sensor[i]);
> +			logged =3D true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  static const struct tpacpi_quirk thermal_quirk_table[] __initconst =3D=
 {
>  	/* Non-standard address for thermal registers on some ThinkPads */
>  	TPACPI_Q_LNV3('R', '1', 'F', true),	/* L13 Yoga Gen 2 */
> @@ -6313,6 +6337,11 @@ static umode_t thermal_attr_is_visible(struct=20
> kobject *kobj,
>=20
>  	int idx =3D sensor_attr->index;
>=20
> +	if (is_sensor_suppressed(idx)) {
> +		pr_info("Sensor %d suppressed\n", idx);
> +		return 0;
> +	}
> +
>  	switch (thermal_read_mode) {
>  	case TPACPI_THERMAL_NONE:
>  		return 0;
> @@ -11653,6 +11682,9 @@ static void __init=20
> thinkpad_acpi_init_banner(void)
>  			thinkpad_id.model_str,
>  			(thinkpad_id.nummodel_str) ?
>  				thinkpad_id.nummodel_str : "unknown");
> +
> +	pr_info("Suppressing %d user-supplied sensor(s) via parameter=20
> suppress_sensor\n",
> +		suppress_sensor_count);
>  }
>=20
>  /* Module init, exit, parameters */
> @@ -11785,6 +11817,9 @@ MODULE_PARM_DESC(experimental,
>  module_param_named(debug, dbg_level, uint, 0);
>  MODULE_PARM_DESC(debug, "Sets debug level bit-mask");
>=20
> +module_param_array(suppress_sensor, int, &suppress_sensor_count, 0444=
);
> +MODULE_PARM_DESC(suppress_sensor, "Comma-separated sensor indices to=20
> suppress (e.g., 3,7)");
> +
>  module_param(force_load, bool, 0444);
>  MODULE_PARM_DESC(force_load,
>  		 "Attempts to load the driver even on a mis-identified ThinkPad whe=
n=20
> true");

The P15 is one of the Linux certified platforms...though it's a bit olde=
r now.

I'd be more interested in figuring out which sensors are returning an er=
ror and figuring out how we address that. I have access to the FW and pl=
atform team for questions (though this platform is a bit older now, so i=
f we need FW fixes that will be trickier). My gut feeling is we shouldn'=
t be creating sysfs entries if the sensors don't exist or aren't accessi=
ble.

I do have a P15 so can check it out (I'm going to have to blow some dust=
 off it). If you've got the details on which sensors need suppressing th=
at would be useful. I have seen previously where it's trying to access a=
 GPU sensor on a UMA model.

Mark
