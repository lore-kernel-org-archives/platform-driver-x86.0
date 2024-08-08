Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95918827
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Aug 2024 21:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723153581; cv=none; b=YHF55RHtBvCzVE5jW9mkcsUBNmz3N8mR1YpYquGoET8gjZyxXk9CQWcJWLVT//4k3T5aiUg5DTKHhWTYZ7v/0hm29LRrXQ4FzMkEhnSjyrdXoP+xowj0tGadmpy0zohp0mFrbDVU1XRtiMuhWpBO+T3hJxyTMmvA9kJQ5KsZ4bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723153581; c=relaxed/simple;
	bh=tNGJs9XPPt0boaQT5JpgYFh2rBDFYacUXpN+gRvGhmc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=eXnxSxknaGfoPxfGpVRbcwMEgEhfA6wC0Hwt6vm5l5lRLI4AE72rdC2vama4ADrkVJgFAP8kXxRVnVH7WS8gYE4krQa6C6NilfCFcbalLQ1VkcdO6ddcDEs/nGCRdwbfPaLYCGEE9Dw//yF9oxOPGOyEITXSSUoTTJiIClOMCcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=stsichler@web.de header.b=js+gBomy; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=stsichler@web.de header.b="js+gBomy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1723153570; x=1723758370; i=stsichler@web.de;
	bh=zsdMECSrCujOeS9fqdc6gvw9n2N4IHNsvU7s7Ktd87s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=js+gBomyh6Uj1EmXRNtkkMCdwLV6JCeqZM+6qJK8H4o8wWcpmwOvwa0ZG4xDL2eL
	 5AOazHlKL9TJEczHMZkdItuxuz+R2MU/MMCcOacMuxjxajqGJN0wxOZvRqsqxyFja
	 8KKyHCcFuQGjx3zHDpb+VMYY8T2X9+orLYeE/6sARqqrxUXaNbiYmCDau4vPd7DPy
	 oJAcOdy+BwQ+5ED5EOTHff4dKFX17b1PX85LXHl8+UYRCt91F1CLDhTx5jM8OKv2S
	 oiQ8FpwK7EMIvYUPyMXQCeU0WBAqwrxkIxhVmVOTkeJ15kV07AjGqnybqGqoy4l5W
	 LAqAIflDVieMS4CJiA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.1.43] ([176.199.210.139]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M4sXj-1sbLkM3u59-002ONQ; Thu, 08
 Aug 2024 23:46:09 +0200
Message-ID: <703cfb2e-6973-421a-9602-657e03ba6105@web.de>
Date: Thu, 8 Aug 2024 23:46:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jorgealtxwork@gmail.com
Cc: platform-driver-x86@vger.kernel.org
References: <20220310210853.28367-3-jorge.lopez2@hp.com>
Subject: Re: [PATCH v5 2/4] Fix SW_TABLET_MODE detection method
Content-Language: en-US
From: Stefan Sichler <stsichler@web.de>
In-Reply-To: <20220310210853.28367-3-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4x8isZjVj8YkXK6kJ3F94DirEG7P+t806cIjUpUBnKU/dOrUizS
 N4XlvTHk8oTqdLnIVYXsaaWj8vpLL2+rh4yzN6ZI4EyIHZgyYLRx/2hMoJh0HXvYNUVXirg
 IyVeJYXnw0UGhdRhM+okiCznmJ7SJyeoMvPRMUKzBC4d2xc6JuuL0GhTwzTaXMjTAAai/NN
 4xbCq0sN/AuiYOOfb1/ZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Jrx8lZTIUBQ=;rmYZyG5pFqn9FfJS1QrJd2H5LDN
 mSO9ofXYyLA1Lx5I+O8gkrEm02P+ufkLY8/hqZzZyeKJwTSxHJ8uEj65EQkvPk7XSBUXy95fB
 pRT4qCyrhNP0jETn/KWrapvs9mCpnn21zVRhyMN8u8xxK88MHjGd2+PH5PoszqW0R6xYqN6rN
 0pmBOyjTekL32OQRoBO71obNOo6PBPwK61qAuelWEfVnwjlEEkuWU06dWzZRWN0q9lrXABnlh
 SC3aC8I93egRY2NfBeqxcfuORR2s65hZ/ePQ08d5/2ZMlRymW3v+tEWgl+axwUe5szehqXmBo
 gXzw4ePSOmIhY4xmaCs55oho9MRFvGZtFpCxg7DPULFBd9S5v8bo3P7ZC6jYL0i5dK0hxtgn7
 YyTvz5HIqBVeeQ38eekJqpikI+iu0tU0WdFsBDQcAvrUG8qcD50YHxQNZXDWECys3hYrIl7XF
 APKfhW/YcjQfNYA4PhNAF4XNikiX73GsjWEIlYoqgMe5T2dhIPAX3Kk5z40k22EsbI5HzK3gz
 5bZ1GHeL8H9GBM7abJhsnzmvz57RCiugP3/NTCp4w9Ht9/PfdyXcEOlxu3ypCXENhdb07OTjI
 40bLcDe8DqW4tWVZt7Wm74n/uGKRJQfRpPgjwk+Y8R1n/fjnUAGmWmuQ1vbCnHx6x76oQEoPK
 pR8Oy5PVCG67bMPnMclWUa70YLFQn9PbPGkPndUwrqTiksRg+jGK3R7jysOuO0s553D37Z5vb
 +Yqb3t1GoRMfxhDDpXO4f35nce2l8LjDRosny32MEF4ZTvArp+WLYakTOIiC9/4jvSpkRPiYv
 boLoUmwkgQdExHNIs9E2iAw2I0YCkLdXXnIBy7JL3cIMs=


Hi,
this patch (which is now committed to the kernel as commit
520ee4ea1cc60251a6e3c911cf0336278aa52634 since v5.18-rc1) unfortunately
introduced a regression on my HP EliteBook 2760p Convertible:

Tablet mode is no longer detected.

It worked flawlessly before (when enable_tablet_mode_sw module param was
set to 1).

Debugging showed that on this device, two problems prevent the table
mode detection from working:

   - Chassis Type is reported as 0x10 (=3D Lunch Box)

   - the query of HPWMI_SYSTEM_DEVICE_MODE does not report tablet state
at all

Note that the chassis type of this device (switch to tablet mode by
screen *rotation*) actually differs from the newer HP models (switch to
tablet mode by screen *flipping*).


I suggest fixing this by re-adding the removed module parameter
"enable_tablet_mode_sw", but change its behavior to work in the
following way:

   - when left at default -1 (auto): no change to current (new)
implementation

   - when set to 0: unconditionally disable table mode reporting at all

   - when set to 1: ignore Chassis type and use old-skool
hp_wmi_hw_state(HPWMI_TABLET_MASK) query method to determine tablet mode
in addition to new hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE...) metho=
d


I prepared a patch based on commit
520ee4ea1cc60251a6e3c911cf0336278aa52634, and tested it successfully on
my device.
See below.

Regards,
Stefan

=2D-- hp-wmi.c.orig	2024-03-10 21:38:09.000000000 +0100
+++ hp-wmi.c	2024-08-08 09:23:29.509113900 +0200
@@ -35,6 +35,10 @@
  MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
  MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");

+static int enable_tablet_mode_sw =3D -1;
+module_param(enable_tablet_mode_sw, int, 0444);
+MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE
reporting (-1=3Dauto, 0=3Dno, 1=3Dyes)");
+
  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
@@ -428,6 +432,9 @@
  	bool tablet_found;
  	int ret;

+	if (!enable_tablet_mode_sw)
+		return -ENODEV;
+
  	chassis_type =3D dmi_get_system_info(DMI_CHASSIS_TYPE);
  	if (!chassis_type)
  		return -ENODEV;
@@ -435,16 +442,24 @@
  	tablet_found =3D match_string(tablet_chassis_types,
  				    ARRAY_SIZE(tablet_chassis_types),
  				    chassis_type) >=3D 0;
-	if (!tablet_found)
+	if (!tablet_found && enable_tablet_mode_sw < 0 /*auto*/)
  		return -ENODEV;

  	ret =3D hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
  				   system_device_mode, zero_if_sup(system_device_mode),
  				   sizeof(system_device_mode));
-	if (ret < 0)
-		return ret;
+	if (ret >=3D 0)
+		ret =3D (system_device_mode[0] =3D=3D DEVICE_MODE_TABLET);
+
+	/* workaround for older convertibles */
+	if (ret <=3D 0 && enable_tablet_mode_sw > 0)
+	{
+		ret =3D hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
+		if (!(ret < 0))
+			ret =3D !!(ret & HPWMI_TABLET_MASK);
+	}

-	return system_device_mode[0] =3D=3D DEVICE_MODE_TABLET;
+	return ret;
  }

  static int omen_thermal_profile_set(int mode)

