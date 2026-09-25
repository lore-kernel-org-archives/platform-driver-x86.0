Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA47390C9E
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354811; cv=none; b=csGMz3LB6ZgVgqjpBPOpBtcEH7kgpKH4Jxb/b/++h0enOSTBJlHAYl6IunMZNDZSGuoe3yZx6EEZpr7foWqnR8PSk95RGB2Ti0XRD3jEPqw/yuPUIrXJ3LOHJT7ml3oQT03nZRITclZeHc4K2jl594CChKApRPyT566EcR81JRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354811; c=relaxed/simple;
	bh=v4zbMBVd04ROW2T+tOrpAtNfuilOaYO7qnOTJVztGR4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=rKKww/6fw+lG3Q8G/kIJETYbtMTbQWF/cL4clWs3kUWgKPsUUNhgUgLNJGfsqxxi6NB5TFxK60j3Gpi4wTmIfuixAjJTjp71nr6/5dXNpZo6IlGQgRWa+jeHRinOxoRd+QpFnnUlgJ4nR6y+d0pKujydZr6DF+RpdFt4rUtWXYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOVTt9Hf; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOVTt9Hf"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e630052ebso1243426eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790354799; x=1790959599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7TMqBaAuOJACF6ayt8XMxrIZEYpCNbQKrLb2Uzj2jcY=;
        b=UOVTt9HfIa9R1AulNLMPpZTZx3+335fwFD1HQYNypGRQfusIie5HJqeXeNR2cTHR/f
         GFW7T5YVmwUSimUzA8sTTNTGVkuY74xCXS9nlIiUsDwDY8ITbdB5xccckLpUcS9IzWkp
         p63qvDvph2jXnytH2sQ9OiArXJUioYYUwzhW+KYb7shMoUeWEyyLeGZtqe9bV9DHzAHg
         UOJ53MVWPhfb74KUptNpXT6UukztMs8Zu6wa7H/9oIBviYiCFt+UkckEmnuFPJrXjXiJ
         wVeW8Eila4eYWb51zh4eqTG92GVUv8TzKWDBlvvU9RDVOW5Z9kFJsF1+3VQA8Qt3X60A
         yFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354799; x=1790959599;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TMqBaAuOJACF6ayt8XMxrIZEYpCNbQKrLb2Uzj2jcY=;
        b=F7fewFVod5vrwrByF84JxW3dHxY5zt3J0ZtfapiYUKQVd1NCEWgar8fOWeiQjKDlt/
         zz9wm0pL6i2yGPrWa6b6BbRxLqKrLvuQ72Fxeos1HXK8heIQQvg20LPkbGrUtn3FUhPQ
         eGPuQGrdU36ZNS/RaF4ZUD1rHSHWzoccIkeY593e0DIr1h8RPE4hWfdUcvhZ2I4yfved
         gvIATj7Bog7wJLPpXvzpxqyJ8YUlV9lT311JFW6exPrZ7I0iVq9KW9L5EdcIwgqldTkN
         NtVUzV7rCO6wrprKlkgqLdBjWOeU+wLivQMltLBlp5YrvAH9mIIepgfmBgeWxoS5JJ80
         kFgg==
X-Forwarded-Encrypted: i=1; AKwUvBwqUqIu6fs3KG6IaCtzV3ddokxdpeuQCXfNW+SBrFdRky0vNNSyCMvOJHh/omIGW6hbf88r0mKOlUGKkaM7yLn351FP@vger.kernel.org
X-Gm-Message-State: AFuF++m4Jd5mw8dDkeObbD52p4vVeePNpD9Ojhm1j3Lx9qWeC7aagB/T
	VidUJWOR7LLYsbJ4W7vdsNeIT/h2dpTMQDKmRPxf+/7SWEnNsEuZVkx1
X-Gm-Gg: AYBFou1f6jibBE9qYDEdGnwZcWo8D3dIwDL/4zPpcDTLq0UiqFy3HuGwYsH4+SPNN9d
	+q7lwVzoPCmM1/FYuDv0gleWK8qb1L/0lJyR68jEz+SyqNQoWtqwiJqMng/M+8EUrehxb9Ic2zJ
	nepA2n4lnI7Afu97E9X23VhdZ1FnTKoyB4cHne+OdqDudEN7IIm90ans66+Suo88Rlvtv1rmTJl
	eyF0yIzcM66JjaG6SY3FRqkYsl8O2+XrEgpJ9ToYeCgKAjHrfMG2ET7Zz9jIbN1WJCS7IwwtE6s
	sLLrirFGh8JiUYSIpASFNRwg2FAVHpYn6RSQtsFK7NgxszgmG53aQvyfxcsCX8qlmZQfhm//aN/
	vGLWaEGcYmlB6y7Hz9FZL6FJLExw/9P3kN2XBrRDtLrR1nHobDwCfD8FB9W1Vri7GKZwcpbh2Fp
	xhwbtit0oA8iC+lGLrG3I7igOp2UiuqtrazLN+21IAXmqf57D3j1l8hK0CqpmXcDgOc01T9LsUE
	0FlrP0dXOc6+q/sNkgAB/Enjp92xGm96/pP764ADuHOFPM+YcyumCWMpTHe0I1VRifH
X-Received: by 2002:a05:7301:6589:b0:33c:130b:458 with SMTP id 5a478bee46e88-34273058634mr1113907eec.41.1790354798751;
        Fri, 25 Sep 2026 09:46:38 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm7553306eec.4.2026.09.25.09.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 09:46:38 -0700 (PDT)
Date: Fri, 25 Sep 2026 09:46:38 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, mpearson-lenovo@squebb.ca
CC: prasanth.ksr@dell.com, W_Armin@gmx.de, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, Dell.Client.Kernel@dell.com,
 platform-driver-x86@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_4/7=5D_platform/x86=3A_think-lm?=
 =?US-ASCII?Q?i=3A_change_name_and_display=5Fname_to_pointers?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260925160047.2063361-5-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca> <20260925160047.2063361-1-mpearson-lenovo@squebb.ca> <20260925160047.2063361-5-mpearson-lenovo@squebb.ca>
Message-ID: <42EA0779-D7C6-4168-9432-0268F7C85471@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 25, 2026 9:00:32 AM PDT, Mark Pearson <mpearson-lenovo@squebb=
=2Eca> wrote:
>Change name and display_name fields to be pointers instead of arrays=2E
>Update initialisation appropriately
>
>Prepartion to make implementation common with the v2 driver=2E
>
>Signed-off-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>---
> drivers/platform/x86/lenovo/Makefile       |  1 +
> drivers/platform/x86/lenovo/think-lmi-v1=2Ec | 10 ++++++++--
> drivers/platform/x86/lenovo/think-lmi=2Eh    |  4 ++--
> 3 files changed, 11 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/=
lenovo/Makefile
>index c404cff99d35=2E=2E1867eb95ee90 100644
>--- a/drivers/platform/x86/lenovo/Makefile
>+++ b/drivers/platform/x86/lenovo/Makefile
>@@ -6,6 +6,7 @@
> obj-$(CONFIG_IDEAPAD_LAPTOP)	+=3D ideapad-laptop=2Eo
> obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi=2Eo
> obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi-v1=2Eo
>+obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi-v2=2Eo
Hi Mark,=20
Was this intended to be added in the next patch? The file doesn't exist ye=
t=2E=20
- Derek
> obj-$(CONFIG_THINKPAD_ACPI)	+=3D thinkpad_acpi=2Eo
>=20
> lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+=3D wmi-hotkey-util=
ities=2Eo
>diff --git a/drivers/platform/x86/lenovo/think-lmi-v1=2Ec b/drivers/platf=
orm/x86/lenovo/think-lmi-v1=2Ec
>index 26a62e1a709b=2E=2E42b31270ca5c 100644
>--- a/drivers/platform/x86/lenovo/think-lmi-v1=2Ec
>+++ b/drivers/platform/x86/lenovo/think-lmi-v1=2Ec
>@@ -1251,6 +1251,8 @@ static void tlmi_attr_setting_release(struct kobjec=
t *kobj)
> {
> 	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>=20
>+	kfree(setting->name);
>+	kfree(setting->display_name);
> 	kfree(setting->possible_values);
> 	kfree(setting);
> }
>@@ -1517,6 +1519,8 @@ static int tlmi_sysfs_init(void)
> 		/* check for duplicate or reserved values */
> 		if (tlmi_validate_setting_name(tlmi_priv=2Eattribute_kset,
> 					       tlmi_priv=2Esetting[i]->display_name) < 0) {
>+			kfree(tlmi_priv=2Esetting[i]->name);
>+			kfree(tlmi_priv=2Esetting[i]->display_name);
> 			kfree(tlmi_priv=2Esetting[i]->possible_values);
> 			kfree(tlmi_priv=2Esetting[i]);
> 			tlmi_priv=2Esetting[i] =3D NULL;
>@@ -1678,10 +1682,10 @@ static int tlmi_analyze(struct wmi_device *wdev)
> 		setting->wdev =3D wdev;
> 		setting->index =3D i;
>=20
>-		strscpy(setting->name, item);
>+		setting->name =3D kstrdup(item, GFP_KERNEL);
> 		/* It is not allowed to have '/' for file name=2E Convert it into '\'=
=2E */
> 		strreplace(item, '/', '\\');
>-		strscpy(setting->display_name, item);
>+		setting->display_name =3D kstrdup(item, GFP_KERNEL);
>=20
> 		/* If BIOS selections supported, load those */
> 		if (tlmi_priv=2Ecan_get_bios_selections) {
>@@ -1807,6 +1811,8 @@ static int tlmi_analyze(struct wmi_device *wdev)
> fail_clear_attr:
> 	for (i =3D 0; i < TLMI_SETTINGS_COUNT; ++i) {
> 		if (tlmi_priv=2Esetting[i]) {
>+			kfree(tlmi_priv=2Esetting[i]->name);
>+			kfree(tlmi_priv=2Esetting[i]->display_name);
> 			kfree(tlmi_priv=2Esetting[i]->possible_values);
> 			kfree(tlmi_priv=2Esetting[i]);
> 		}
>diff --git a/drivers/platform/x86/lenovo/think-lmi=2Eh b/drivers/platform=
/x86/lenovo/think-lmi=2Eh
>index 31359879629e=2E=2Efd8a98c2fdaa 100644
>--- a/drivers/platform/x86/lenovo/think-lmi=2Eh
>+++ b/drivers/platform/x86/lenovo/think-lmi=2Eh
>@@ -104,8 +104,8 @@ struct tlmi_attr_setting {
> 	struct kobject kobj;
> 	struct wmi_device *wdev;
> 	int index;
>-	char name[TLMI_SETTINGS_MAXLEN];
>-	char display_name[TLMI_SETTINGS_MAXLEN];
>+	char *name;
>+	char *display_name;
> 	char *possible_values;
> };
>=20

