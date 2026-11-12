Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472348;
	b=HY4KJCGZueEoDhoCZUGrXeNNmL41WvSBJPTi2kaqNjF+P8G0Gt12QsyvAEIdIBHmzIBz
	 bnji2GVznOBHJ5vtX2Di6DREhsYGM+XR+2ql5anGIe3rUcKXs7IlLTeutXtw8u9sibm0g
	 pLl15oH55nLD05mLXyXyeU4ym9gVW0FRKGY2uW3l7rLOl9QErfO1RpUAbJ3qIxjiqVRYj
	 Uje0VEzthGiElvvm6YBVUqYMjihnUF4lrEfzitS3LVZGRQLbVfZ04AA0Umvc29hGWf6IJ
	 ji3SlyB9VYSwnvJbm9fiUQCxXQVtqkH7jGk7M4HVS6bWyqgvV4LsUnoNlxov4hLh7sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472348;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Message-ID:In-Reply-To:
	 References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Correlation-ID;
	bh=OexHV2jkzmUB3KUYxDmJ9ACHH6etmTUSSH2bbmegmmo=;
	b=EaVhc/HcrsI7H8kqdNwpybqUcOCUsjjSrzHHhrbIOovaVCSD/YYsZdZnzvp4FmdwDChh
	 JyTNphOfGLPWyFqnTLojDXXH2ZgC0aznCXWNMEel+raQEevhTNnx0QlfXlkGwviDj5+5u
	 B64S00N5kYrXHPtqdLwRqCGek6JRAOHXFQdlshGzCpFZvMLAu5lpbjf7/q8QiNwv2h6Gg
	 JSGe6LhjglYNv7O7Xw9v2rMwbdtiYlFI5h2d9k4cp5N/qmeSVj9U2rWAviHEXvr+Q9mfd
	 M3o5DGoZn0N+G97xRybFrGbGd+JDAfyCRpCqqiejgUyXNTlsLA/kkiUIdibX4y0e7pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="YexZpL/G";
	arc=none smtp.remote-ip=95.215.58.178
Received: from mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F8D606A8BC
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 08:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F8D606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YexZpL/G
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OexHV2jkzmUB3KUYxDmJ9ACHH6etmTUSSH2bbmegmmo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794472344; v=1; x=1795077144;
 b=YexZpL/GbOXSNExWWu391KEx4IBGVDGoRFSoV4hfOCJVcHIAL4H2mrOT53bARYl4uv8JwMIX
 lI4L9GHGPEz726dJoedOf7aZXodbwSC2lCTXVATqVLcsT9B7KZ3WaB9fYmrY1z7zfgE/UAIdXsp
 FouudAlCtwI4WVwAaSWTaeZI=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5d4ba3925192b16f;
	Thu, 12 Nov 2026 08:32:24 +0000
X-Mizu-Trace-ID: 5d4ba3925192b16f
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 09:32:21 +0100
From: Denis Benato <denis.benato@linux.dev>
To: Andrei Rusu de Castro <arc@empyreal.works>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <ec9515fb-6698-4e7e-8a88-5b3fa2f50c51@linux.dev>
In-Reply-To: <20261111-asus-wmi-tpolicy-5fbc4e09@empyreal.works>
References: <20261111-asus-wmi-tpolicy-5fbc4e09@empyreal.works>
Subject: Re: [PATCH] platform/x86: asus-wmi: write the thermal policy only
 when it changes
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <ec9515fb-6698-4e7e-8a88-5b3fa2f50c51@linux.dev>

11 nov 2026 22:44:03 Andrei Rusu de Castro <arc@empyreal.works>:

> On the ROG Flow Z13 (GZ302EA), writing the throttle thermal policy makes
> the firmware re-apply its own package power limits for that mode, also
> when the written mode is the one already set. Userspace re-asserts the
> current platform profile on events such as AC plug and unplug, so power
> limits tuned after a profile change are silently replaced by the
> firmware's table for the unchanged mode.

Hi Andrei,

Thanks for spotting this!

>=20
> Remember whether the firmware is known to be in the cached mode and skip
> the WMI call in the platform_profile handler when the requested profile
> matches it. A failed write clears that state, and so does restore from
> hibernation, where the firmware starts afresh, so the next profile write
> reaches it again. The throttle_thermal_policy attribute and the fan
> curve reset still write the mode every time.

I don't agree with this: if the userspace requests a power profile change t=
he driver must honor that request.

The core issue here is not the application of the requested power profile b=
ut the fact that asus-armoury can get out-of-sync with what is set versus w=
hat is reported.

I would suggest fixing that issue instead: when the platform profile is cha=
nged, if a custom tdp is set you should make limits re-apply (or, perhaps e=
ven easier, reflect the fact custom TDP got disabled, albeit I am not sure =
this is true for every laptop and I highly doubt that).

This way the kernel honors requests from the user without reporting false i=
nformation, with the added bonus that even if the profile switched (without=
 unplugging/plugging in the laptop) the reported status is faithful.

Best regards,
Denis B.

>=20
> On a GZ302EA running 7.4-rc2 with this change, re-asserting the current
> profile, as happens on AC unplug, leaves package power limits set from
> userspace in place.
>=20
> An LLM assisted with finding the cause, writing this change and its
> description, and running the test above on my GZ302EA.
>=20
> Signed-off-by: Andrei Rusu de Castro <arc@empyreal.works>
> ---
> drivers/platform/x86/asus-wmi.c | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index b33ebdb21..4f37a83c2 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -315,6 +315,8 @@ struct asus_wmi {
>=20
> =C2=A0=C2=A0=C2=A0 u8 throttle_thermal_policy_mode;
> =C2=A0=C2=A0=C2=A0 u32 throttle_thermal_policy_dev;
> +=C2=A0=C2=A0 /* the firmware is known to be in throttle_thermal_policy_m=
ode */
> +=C2=A0=C2=A0 bool throttle_thermal_policy_synced;
>=20
> =C2=A0=C2=A0=C2=A0 bool cpu_fan_curve_available;
> =C2=A0=C2=A0=C2=A0 bool gpu_fan_curve_available;
> @@ -4183,9 +4185,11 @@ static int throttle_thermal_policy_write(struct as=
us_wmi *asus)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "throt=
tle_thermal_policy");
>=20
> =C2=A0=C2=A0=C2=A0 if (err) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asus->throttle_thermal_policy_synce=
d =3D false;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Failed to set throttl=
e thermal policy: %d\n", err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
> =C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0 asus->throttle_thermal_policy_synced =3D true;
>=20
> =C2=A0=C2=A0=C2=A0 /* Must set to disabled if mode is toggled */
> =C2=A0=C2=A0=C2=A0 if (asus->cpu_fan_curve_available)
> @@ -4302,6 +4306,16 @@ static int asus_wmi_platform_profile_set(struct de=
vice *dev,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> =C2=A0=C2=A0=C2=A0 }
>=20
> +=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0 * Write the mode only when it changes. The firmware a=
pplies its whole
> +=C2=A0=C2=A0=C2=A0 * power table for a mode each time the mode is writte=
n, replacing
> +=C2=A0=C2=A0=C2=A0 * package power limits tuned since then (ROG Flow Z13=
 GZ302EA), and
> +=C2=A0=C2=A0=C2=A0 * userspace re-asserts the current profile on power-s=
upply events.
> +=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0 if (asus->throttle_thermal_policy_synced &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asus->throttle_thermal_policy_mode =
=3D=3D tp)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> +
> =C2=A0=C2=A0=C2=A0 asus->throttle_thermal_policy_mode =3D tp;
> =C2=A0=C2=A0=C2=A0 return throttle_thermal_policy_write(asus);
> }
> @@ -5404,6 +5418,9 @@ static int asus_hotk_restore(struct device *device)
> =C2=A0=C2=A0=C2=A0 struct asus_wmi *asus =3D dev_get_drvdata(device);
> =C2=A0=C2=A0=C2=A0 int bl;
>=20
> +=C2=A0=C2=A0 /* The firmware booted afresh; the next profile write must =
reach it. */
> +=C2=A0=C2=A0 asus->throttle_thermal_policy_synced =3D false;
> +
> =C2=A0=C2=A0=C2=A0 /* Refresh both wlan rfkill state and pci hotplug */
> =C2=A0=C2=A0=C2=A0 if (asus->wlan.rfkill)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asus_rfkill_hotplug(asus);
> --=20
> 2.56.0
