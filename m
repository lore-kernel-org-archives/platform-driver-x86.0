Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664B750EC17
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983791; cv=none; b=PJMI5K8EvwZLXCnnhUwpGy65yOHzKySyvH7ZBHfKkoApuueC3Gc/y7TZSmpAEoCSsusdrhJm907m3nuaSw135N5/l2Wc5YV0bLqF/2pi+t7m8bfLG7Dhp34jhnld6zMoy7+BiyjLlfW+a2oYQCRcofFT32YVTiTC8z6QRasiw2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983791; c=relaxed/simple;
	bh=3U1uisxjOpalpseJgN6zG2zLbYAZry+tMxTyd8UL5cs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gXM2I6SznMFYJoG1BmToPBF2FND2m9Y4lbA4he6gqDF7LIEYUj7cspoo0nY4G4UH6w0NrnjEO3eCFCtm2Taz8ymGI0I8/dLlb+a9t1gx5gNiiJ+pTSzC3xznPnS/jrvnNM63aQg6/pgYFtFGzuL8s2l/7H4RGZVceSt3v1R3U3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=VbOF+OIe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JvM5Kavz; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="VbOF+OIe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JvM5Kavz"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 625271400107
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 09:16:26 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 14 Oct 2026 09:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791983785;
	 x=1792070185; bh=rh8hBvY+7rUW9MF0+hkllZF8IacAD+CRyZ4np6eQyj8=; b=
	VbOF+OIe80sBUrj8lVtDCAKetOr45i7PetNvPIEgQ3z8Wg1LhR1uB3CfvyoOYt8i
	O9E5gceiQhrECO6PyBP+XXBdJ1ZOEMmQgCI2mAVOvoMvf0fPzeUlLfHvTVl/y7w3
	Q9P/QvwNnLB5do6sk17XNYuf27N6EOFsWQ5gdW9YOiafsg1cHEtKeIvGpG3QEhvE
	dM5+epIdmK3wtz+dtGiGJp/bHhzLaldCeMGGIx+Rh8oy3n+zMQHzXhKlT+04fkcy
	FYqGn5Km7xWorktvZnxqGERYqQBEGyR3+HMcVbyVeeBFkYzvFNIyCyRQ/q4p9WYv
	WjhWeum1cAgPdq+razEmPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791983785; x=
	1792070185; bh=rh8hBvY+7rUW9MF0+hkllZF8IacAD+CRyZ4np6eQyj8=; b=J
	vM5KavzpYXXS1OJLioXWvIIrS9tlNfvn9+f7dXOPDOnVXda+fZaLgV/VEHdVArUR
	Nr2rGpdShi9LB2hsCKfZQH97BvgQS7lJnNJ/1OIcVmpG3EDIMIQO3tjA01SKsJl4
	ndL5Yi1HMY+cLh6PLUZ4WkfjgSChPWUVwzt/bg17AvlQ1EAdDy2bk1nKUZhoUO1D
	xtl9R049bY5tOjS0IfhFsTbrxsKrWz7LhYNH6nMc9JU53BGUnkt2Q2kZKAC0sp0c
	Md7dwq1z4B1/PFHduv939SPRWayB51TEkF3N17sHX6ecHr2V/+GYl+yWR5/WLE3/
	+1kfMBehvE+zaS/XksXqA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791983785; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:iEpLJeIPdwqX0XuMIJIk0A7wTHp94N+/YiHnbqIcVTVqhAe
	NEgxzlhP7ATx3He7myv30XDvMCCkNohkAABs9jeV5BMB+osj6+xWHHUSV4QMEYoW
	iFggnmkFiICs0nmZH6M18swg8NaMmrx+am2FMhZ5MtH+dofoe974u7XVFmhhwDEZ
	UTGOJw/xGBP2+thDXMIOUe9T4AlIPlX2R2PpsmxOAfx7Hg7YHKaKvS6LMtJRhEAM
	rvbMM9SISB0zMLOdMlCbq9jthtnOUrVraTIG8TCesNNlc9xBssaX8+43JrxMj9Tv
	050RVcsJW79JjDCdvO9gdoS/GVeDOm9cZVZCz3g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:QQ5efhMgBC6TF/5pmUuyeWaIecd7UDtHd8WThJx2Xaw=:3U1uisxjOpalpseJgN6zG2zLbYAZry+tMxTyd8UL5cs=;
X-ME-Sender: <xms:qIDPamenDLwac2M0VOIncKN_FsbAMeJ48bWeRaaaj4mlH8CD7E2u2A>
    <xme:qIDParCkTPA_ewO7xeyDbMvYirZwrJefhOaD2aY_wnYcr0Jc3DH_VZSccbWH8C1u5
    L5eWAtYe7Q5SJ5pcs5sBuk2nyo530LPeZnL5CW9xwhrnjq7wpqJsYg>
X-ME-Proxy-Cause: dmFkZTGaOqWZRjaY7PZEk/bbs0TyrOqgyl+/Zgvocw9LDXM7X1KAJNIYXoWVTieOF6WW0Z
    POv97AsGRyA0y4JVTWzQWb6TcJo8zfOJLfp8cvRCYjBih/L6NEWz4BuGe9HPYldbh1kh84
    CRovvoxVfIKhtOyrr2CqgsO/0OnTmdhFCvXwd1M+MybliluBk4/ys+7Kzgg5dya3gaVTBP
    tJWcAcgK4A9Dlnvwrc0nLU6fOfayDDtJX7btvdVwHNHgI3ztZNA6EMSMOmzTqmg9U4uzFV
    Po95/o28jCtzbDA+JooMaYNqXvmOYK/WpnlBArquARzddM0QrFrEhRnHEqz8y4z1oS5Wew
    RTVU4a46S4pJ3g6sdy2UsEWtHn5zTs1eM3t3JtMtb4K0QGzlWyj2k9GHS/CmK7qbIIdiFF
    2USFDpFtoZ7CER/iAz0abThZpoU0xlkiIMyEFc1haLwKhGq8I77tVevg6nQozT3WSVaw87
    4ibuHb0hBTL209DNv1oDHjwOtwAvSFJCaK8LEgYXPpMYUHUk+XeZbNQdW0Mj7V98qnHTbk
    cPFTajaGuih6uBl4K7PvUUQT6NRusUHKiSLPrC48PkhP6Hd5mOTCYtond9XiPmO9CbYI5v
    pd7j4ufWhqCpU98LWwqLxyBaZDdeOdMe9MT/9bK2c5BEbhmhcpRF/E569eEQ
X-ME-Proxy: <xmx:qIDPagGxpoDjh8fgFQ-3bpVvWmj2pSjqZdh9RSy8e1bakLJIZX4H4A>
    <xmx:qIDPajajOefEbf2Gf3bA5Qyyfe_8z8-A9GzAv4ETf7i8kpKVA3YQ8Q>
    <xmx:qIDPaqBdz_mnHPVH9Kqn0zyTRdpe0LGaMXHNTMw7e8KLJuB7FO6VTg>
    <xmx:qIDPajmYUUkIzq9WOJ1yxRVxtPyy9izRG0DNy2S2aLnypWmthp1INQ>
    <xmx:qYDPaip3LN4d4ad0AcxF67XZiwgHchavO-hAZF9X583gS6uFscewsXCm>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 860BC2C0007C; Wed, 14 Oct 2026 09:16:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AcGzoZcWswFR
Date: Wed, 14 Oct 2026 09:16:04 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Prasanth Ksr" <prasanth.ksr@dell.com>, "Armin Wolf" <W_Armin@gmx.de>,
 "Hans de Goede" <hansg@kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, Dell.Client.Kernel@dell.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <224296aa-0106-44fe-b521-9182d12a97ad@app.fastmail.com>
In-Reply-To: <2428e3c0-21fc-ea5c-62a4-5c00b0f5e4e8@linux.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-6-mpearson-lenovo@squebb.ca>
 <2428e3c0-21fc-ea5c-62a4-5c00b0f5e4e8@linux.intel.com>
Subject: Re: [RFC PATCH 5/7] platform/x86: think-lmi: Initial ThinkLMI v2 driver
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ilpo

On Wed, Oct 14, 2026, at 5:01 AM, Ilpo J=C3=A4rvinen wrote:
> On Fri, 25 Sep 2026, Mark Pearson wrote:
>
>> Lenovo Thinkpad, Thinkstation and ThinkCenter are moving to a new com=
mon
>> WMI implementation.
>>=20
>> This driver adds initial support for the new implementation, allowing
>> attributes to be read and modified.
>>=20
>> Certificate based authentication is not implemented in this
>> version.
>>=20
>> think-lmi is updated to use this driver if supported by the HW and
>> requested by the user.
>>=20
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>>  drivers/platform/x86/lenovo/think-lmi-v2.c | 960 +++++++++++++++++++=
++
>>  drivers/platform/x86/lenovo/think-lmi.c    |   9 +-
>>  drivers/platform/x86/lenovo/think-lmi.h    |  59 ++
>>  3 files changed, 1025 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c
>>=20
>> diff --git a/drivers/platform/x86/lenovo/think-lmi-v2.c b/drivers/pla=
tform/x86/lenovo/think-lmi-v2.c
>> new file mode 100644
>> index 000000000000..5bc0a349c5fb
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo/think-lmi-v2.c
>> @@ -0,0 +1,960 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Think LMI V2 BIOS configuration driver
>> + *
>> + * Copyright(C) 2026 Lenovo
>> + * Distributed under the GPL-2.0 license
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/string_helpers.h>
>> +#include <linux/wmi.h>
>
> I'm very very skeptical this is all you use below. ;-)

Yeah. Sorry - as this was RFC I didn't worry too much about the includes=
. It's definitely on the skimpy side :)

>
>> +#include "../firmware_attributes_class.h"
>> +#include "think-lmi.h"
>> +
>> +/*
>> + * Name: BiosSetting
>> + * Description: Get item name and settings for current LMI instance.
>> + * Type: Query
>> + */
>> +#define LENOVO_BIOS_SETTING_GUID "4B79FBA6-FFD4-41B6-8EA8-E81CDA0F5F=
C3"
>> +
>> +/*
>> + * Name: Configuration
>> + * Description: The Configuration class provides methods to configur=
e the
>> + * BIOS settings, change system behavior, and perform certain actions
>> + * After making changes to the BIOS settings, you must reboot the co=
mputer
>> + * before the changes will take effect.
>> + * Type: Method
>> + */
>> +#define LENOVO_BIOS_CONFIGURATION_GUID "816E5C9E-3E99-4385-AA5A-7353=
E14B781B"
>> +
>> +/* Method IDS for configuration GUID */
>> +#define SET_ID          1
>> +#define SAVE_ID         2
>> +#define DISCARD_ID      3
>> +#define LOAD_FACTORY_ID 4
>> +#define LOAD_CUSTOM_ID  5
>> +
>> +#define LENOVO_BIOS_ACCESS_DATA_GUID "1178acfd-78a1-46d8-a8eb-5f7cb7=
4a3b4e"
>> +#define LENOVO_BIOS_ACCESS_GUID "5cb5f556-30ce-40d3-a135-7ca0648a5a5=
2"
>> +
>> +/* Method IDS for Access GUID */
>> +#define SET_PASSWORD    1
>> +#define AUTHENTICATE    2
>> +#define SET_CERT        3
>> +#define UPDATE_CERT     4
>> +#define CLEAR_CERT      5
>> +#define CERT_TO_PWD     6
>> +#define CERT_THUMBPRINT 7
>> +
>> +static bool tlmi_initialised;
>> +#define TLMI_POP_PWD  BIT(0) /* Power-on */
>> +#define TLMI_SVP_PWD  BIT(1) /* Supervisor */
>> +#define TLMI_SMP_PWD  BIT(2) /* System Management */
>> +#define TLMI_SVC_PWD  BIT(7) /* Supervisor Certificate */
>> +#define TLMI_SMC_PWD  BIT(8) /* System Certificate */
>
> Yeah, it wasn't. Please go through the code and add includes for what =
you=20
> actually use.
>
>> +
>> +static struct think_lmi tlmi_priv;
>> +
>> +static DEFINE_MUTEX(tlmi_lock);
>> +
>> +/* ---- Utility/access functions -----------------------------*/
>> +
>> +static inline struct tlmi_pwd_setting *to_tlmi_pwd_setting(struct ko=
bject *kobj)
>> +{
>> +	return container_of(kobj, struct tlmi_pwd_setting, kobj);
>> +}
>> +
>> +static inline struct tlmi_attr_setting *to_tlmi_attr_setting(struct =
kobject *kobj)
>> +{
>> +	return container_of(kobj, struct tlmi_attr_setting, kobj);
>> +}
>> +
>> +static const struct tlmi_err_codes tlmi_errs[] =3D {
>> +	{"Success", 0},
>> +	{"Not Supported", -EOPNOTSUPP},
>> +	{"Invalid Parameter", -EINVAL},
>> +	{"Access Denied", -EACCES},
>> +	{"System Busy", -EBUSY},
>> +	{"System Locked", -EACCES},
>
> I suggest aligning the errno's for better readability.
>
>> +};
>> +
>> +static const char * const level_options[] =3D {
>> +	[TLMI_LEVEL_USER] =3D "user",
>> +	[TLMI_LEVEL_MASTER] =3D "master",
>> +};
>> +
>> +/* Check for return errors and if found convert to suitable error co=
de */
>
> Grammar.
>
>> +static int tlmi_returnstr_to_err(const char *errstr)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < sizeof(tlmi_errs) / sizeof(struct tlmi_err_codes)=
; i++) {
>
> ARRAY_SIZE()
>
>> +		if (!strcmp(tlmi_errs[i].err_str, errstr))
>> +			return tlmi_errs[i].err_code;
>> +	}
>> +	return 0; /* assume valid data */
>> +}
>> +
>> +/* Extract data or error string from WMI return buffer */
>> +static int tlmi_extract_output(const struct acpi_buffer *output, cha=
r **data)
>> +{
>> +	const union acpi_object *obj;
>> +	int tlmi_err;
>> +	char *ret_str;
>> +
>> +	obj =3D output->pointer;
>> +	if (!obj)
>> +		return -ENOMEM;
>> +
>> +	if (obj->type !=3D ACPI_TYPE_STRING)
>> +		return -EIO;
>> +
>> +	if (!obj->string.pointer)
>> +		return -EIO;
>> +
>> +	ret_str =3D kstrdup(obj->string.pointer, GFP_KERNEL);
>> +	if (!ret_str)
>> +		return -ENOMEM;
>> +
>> +	/* Check if error string was returned */
>> +	tlmi_err =3D tlmi_returnstr_to_err(ret_str);
>> +
>> +	/* If not an error string, and caller wants data, pass it back */
>> +	if (!tlmi_err && data)
>> +		*data =3D ret_str;
>> +	else /* error string no longer needed */
>> +		kfree(ret_str);
>
> Lets start with a right foot by using __free(). Use no_free_ptr() for =
the=20
> case where you want to keep the allocation.
>
Ack - I wasn't aware of this actually. Interesting and will use. Thanks

>> +
>> +	return tlmi_err;
>> +}
>> +
>> +/* Utility function to execute WMI call to BIOS */
>> +static int tlmi_simple_call(const char *guid, int instance, int meth=
od,
>> +			    char *buf, int len, char **data)
>> +{
>> +	const struct acpi_buffer input =3D { len, buf };
>> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>> +	acpi_status status;
>> +	int err =3D 0;
>> +
>> +	status =3D wmi_evaluate_method(guid, instance, method, &input, &out=
put);
>> +	if (ACPI_FAILURE(status)) {
>> +		kfree(output.pointer);
>> +		return -EIO;
>> +	}
>> +	err =3D tlmi_extract_output(&output, data);
>> +	kfree(output.pointer);
>
> __free() should be used to avoid having to duplicate kfree().
>
>> +	return err;
>> +}
>> +
>> +/* ---- sysfs entries ----------------------------------------------=
----------- */
>> +static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj=
_attribute *attr,
>> +				   char *buf)
>> +{
>> +	return sprintf(buf, "%d\n", tlmi_priv.pending_changes);
>
> You used sysfs_emit() correctly below but this is sprintf() for some=20
> reason.
>

Ouch. Sorry.

>> +}
>> +
>> +static struct kobj_attribute pending_reboot =3D __ATTR_RO(pending_re=
boot);
>> +
>> +static ssize_t save_settings_show(struct kobject *kobj, struct kobj_=
attribute *attr,
>> +				  char *buf)
>> +{
>> +	return sysfs_emit(buf, "%s\n", tlmi_priv.save_required ? "needed" :=
 "not-needed");
>
> Why the dash?
>
> Why is this a string, it looks just boolean data for me?
>
True. This is a left over from think-lmi v1.

>> +}
>> +
>> +static ssize_t save_settings_store(struct kobject *kobj, struct kobj=
_attribute *attr,
>> +				   const char *buf, size_t count)
>> +{
>> +	int ret =3D 0;
>> +
>> +	/* save command triggered by writing 'save' */
>> +	if (strncmp(buf, "save", 4))
>
> So anything starting with save goes?

I can make it be just "save".

>
>> +		return -EINVAL;
>> +
>> +	/* Use lock in case multiple WMI operations needed */
>> +	guard(mutex)(&tlmi_lock);
>> +
>> +	/* Check there is actually something to save */
>> +	if (!tlmi_priv.save_required)
>> +		return -ENOENT;
>> +
>> +	ret =3D tlmi_simple_call(LENOVO_BIOS_CONFIGURATION_GUID, 0, SAVE_ID=
, NULL, 0, NULL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	tlmi_priv.save_required =3D false;
>> +	tlmi_priv.reboot_required =3D true;
>> +
>> +	if (!tlmi_priv.pending_changes) {
>> +		tlmi_priv.pending_changes =3D true;
>> +		/* let userland know it may need to check reboot pending again */
>> +		kobject_uevent(&tlmi_priv.class_dev->kobj, KOBJ_CHANGE);
>> +	}
>> +	return ret ?: count;
>> +}
>> +
>> +static struct kobj_attribute save_settings =3D __ATTR_RW(save_settin=
gs);
>> +
>> +/* ---- Authentication sysfs ---------------------------------------=
------------------ */
>> +static ssize_t is_enabled_show(struct kobject *kobj, struct kobj_att=
ribute *attr,
>> +			       char *buf)
>> +{
>> +	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>> +
>> +	return sysfs_emit(buf, "%d\n", setting->pwd_enabled);
>> +}
>> +
>> +static struct kobj_attribute auth_is_pass_set =3D __ATTR_RO(is_enabl=
ed);
>> +
>> +static ssize_t current_password_store(struct kobject *kobj,
>> +				      struct kobj_attribute *attr,
>> +				      const char *buf, size_t count)
>> +{
>> +	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>> +	size_t pwdlen, arglen;
>> +	char *argbuf =3D NULL;
>> +	int ret;
>> +
>> +	pwdlen =3D strlen(buf);
>> +	/* pwdlen =3D=3D 0 is allowed to clear the password */
>> +	if (pwdlen && (pwdlen < setting->minlen || pwdlen > setting->maxlen=
))
>> +		return -EINVAL;
>> +
>> +	strscpy(setting->password, buf, setting->maxlen);
>> +	/* Strip out CR if one is present - setting password won't work if =
it is present */
>> +	strreplace(setting->password, '\n', '\0');
>> +
>> +	arglen =3D wmi_calculate_string_buffer(setting->password);
>> +	argbuf =3D kzalloc(arglen, GFP_KERNEL);
>> +	if (!argbuf)
>> +		return -ENOMEM;
>> +
>> +	ret =3D wmi_populate_string_buffer(argbuf, arglen, setting->passwor=
d);
>> +	if (ret < 0) {
>> +		kfree(argbuf);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret =3D tlmi_simple_call(LENOVO_BIOS_ACCESS_GUID, 0, AUTHENTICATE, =
argbuf, arglen, NULL);
>> +	kfree(argbuf);
>
> Use __free().
>
>> +
>> +	/* Ignore error if password is being cleared. Authentication is cle=
ared */
>> +	if (!pwdlen)
>> +		return count;
>> +
>> +	return ret ?: count;
>> +}
>> +
>> +static struct kobj_attribute auth_current_password =3D __ATTR_WO(cur=
rent_password);
>> +
>> +static ssize_t new_password_store(struct kobject *kobj,
>> +				  struct kobj_attribute *attr,
>> +				  const char *buf, size_t count)
>> +{
>> +	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>> +	size_t pwdlen, cur_pwdlen, arglen;
>> +	char *argbuf =3D NULL, *start;
>> +	enum pwd_type_v2 pwd_type;
>> +	char *new_pwd;
>> +	int ix =3D 0;
>> +	int ret;
>> +
>> +	if (!capable(CAP_SYS_ADMIN))
>> +		return -EPERM;
>> +
>> +	if (!tlmi_priv.can_set_bios_password)
>> +		return -EOPNOTSUPP;
>> +
>> +	/* Strip out CR if one is present, setting password won't work if i=
t is present */
>> +	new_pwd =3D kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
>> +	if (!new_pwd)
>> +		return -ENOMEM;
>> +
>> +	/* Use lock in case multiple WMI operations needed */
>> +	guard(mutex)(&tlmi_lock);
>> +
>> +	pwdlen =3D strlen(new_pwd);
>> +	/* pwdlen =3D=3D 0 is allowed to clear the password */
>> +	if (pwdlen && (pwdlen < setting->minlen || pwdlen > setting->maxlen=
)) {
>> +		ret =3D -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	cur_pwdlen =3D wmi_calculate_string_buffer(setting->password);
>> +	pwdlen =3D wmi_calculate_string_buffer(new_pwd);
>> +	arglen =3D 2 + cur_pwdlen + pwdlen;
>> +	argbuf =3D kzalloc(arglen, GFP_KERNEL);
>
> Use __free(), remove out label.
>
>> +	if (!argbuf) {
>> +		ret =3D -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	pwd_type =3D setting->type_v2;
>> +	/* For HDD and NVME - check if we're user/master and drive index */
>> +	if (setting =3D=3D tlmi_priv.pwd_hdd) {
>> +		if (setting->level =3D=3D TLMI_LEVEL_MASTER)
>> +			pwd_type =3D MASTERHDD1;
>> +		pwd_type +=3D (setting->index - 1);
>> +	} else if (setting =3D=3D tlmi_priv.pwd_nvme) {
>> +		if (setting->level =3D=3D TLMI_LEVEL_MASTER)
>> +			pwd_type =3D MASTERNVME1;
>> +		pwd_type +=3D (setting->index - 1);
>> +	}
>> +	argbuf[0] =3D pwd_type;
>> +	start =3D argbuf + 2;
>> +
>> +	ix =3D wmi_populate_string_buffer(start, cur_pwdlen, setting->passw=
ord);
>> +	if (ix < 0)
>> +		goto out;
>> +	start +=3D ix;
>> +	ix =3D wmi_populate_string_buffer(start, pwdlen, new_pwd);
>> +	if (ix < 0)
>> +		goto out;
>> +
>> +	ret =3D tlmi_simple_call(LENOVO_BIOS_ACCESS_GUID, 0, SET_PASSWORD, =
argbuf, arglen, NULL);
>> +	if (ret)
>> +		goto out;
>> +
>> +out:
>> +	kfree(new_pwd);
>> +	kfree(argbuf);
>> +	return ret ?: count;
>> +}
>> +
>> +static struct kobj_attribute auth_new_password =3D __ATTR_WO(new_pas=
sword);
>> +
>> +static ssize_t min_password_length_show(struct kobject *kobj, struct=
 kobj_attribute *attr,
>> +					char *buf)
>> +{
>> +	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>> +
>> +	return sysfs_emit(buf, "%d\n", setting->minlen);
>> +}
>> +
>> +static struct kobj_attribute auth_min_pass_length =3D __ATTR_RO(min_=
password_length);
>> +
>> +static ssize_t max_password_length_show(struct kobject *kobj, struct=
 kobj_attribute *attr,
>> +					char *buf)
>> +{
>> +	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>> +
>> +	return sysfs_emit(buf, "%d\n", setting->maxlen);
>> +}
>> +
>> +static struct kobj_attribute auth_max_pass_length =3D __ATTR_RO(max_=
password_length);
>> +
>> +static ssize_t mechanism_show(struct kobject *kobj, struct kobj_attr=
ibute *attr,
>> +			      char *buf)
>> +{
>> +	return sysfs_emit(buf, "password\n");
>> +}
>> +
>> +static struct kobj_attribute auth_mechanism =3D __ATTR_RO(mechanism);
>> +
>> +static ssize_t role_show(struct kobject *kobj, struct kobj_attribute=
 *attr,
>> +			 char *buf)
>> +{
>> +	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>> +
>> +	return sysfs_emit(buf, "%s\n", setting->role);
>> +}
>> +
>> +static struct kobj_attribute auth_role =3D __ATTR_RO(role);
>> +
>> +static ssize_t index_show(struct kobject *kobj, struct kobj_attribut=
e *attr,
>> +			  char *buf)
>> +{
>> +	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>> +
>> +	return sysfs_emit(buf, "%d\n", setting->index);
>> +}
>> +
>> +static ssize_t index_store(struct kobject *kobj,
>> +			   struct kobj_attribute *attr,
>> +			   const char *buf, size_t count)
>> +{
>> +	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>> +	int err, val;
>> +
>> +	err =3D kstrtoint(buf, 10, &val);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	if (val < 0 || val > TLMI_INDEX_MAX)
>> +		return -EINVAL;
>> +
>> +	setting->index =3D val;
>> +	return count;
>> +}
>> +
>> +static struct kobj_attribute auth_index =3D __ATTR_RW(index);
>> +
>> +static ssize_t level_show(struct kobject *kobj, struct kobj_attribut=
e *attr,
>> +			  char *buf)
>> +{
>> +	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>> +
>> +	return sysfs_emit(buf, "%s\n", level_options[setting->level]);
>> +}
>> +
>> +static ssize_t level_store(struct kobject *kobj,
>> +			   struct kobj_attribute *attr,
>> +			   const char *buf, size_t count)
>> +{
>> +	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>> +	int i;
>> +
>> +	/* Scan for a matching profile */
>> +	i =3D sysfs_match_string(level_options, buf);
>> +	if (i < 0)
>> +		return -EINVAL;
>> +
>> +	setting->level =3D i;
>> +	return count;
>> +}
>> +
>> +static struct kobj_attribute auth_level =3D __ATTR_RW(level);
>> +
>> +static umode_t auth_attr_is_visible(struct kobject *kobj,
>> +				    struct attribute *attr, int n)
>> +{
>> +	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>> +
>> +	/* We only want to display level and index settings on HDD/NVMe */
>> +	if (attr =3D=3D &auth_index.attr || attr =3D=3D &auth_level.attr) {
>> +		if (setting =3D=3D tlmi_priv.pwd_hdd || setting =3D=3D tlmi_priv.p=
wd_nvme)
>> +			return attr->mode;
>> +		return 0;
>> +	}
>> +
>> +	return attr->mode;
>> +}
>> +
>> +static struct attribute *auth_attrs[] =3D {
>> +	&auth_is_pass_set.attr,
>> +	&auth_min_pass_length.attr,
>> +	&auth_max_pass_length.attr,
>> +	&auth_current_password.attr,
>> +	&auth_new_password.attr,
>> +	&auth_role.attr,
>> +	&auth_mechanism.attr,
>> +	&auth_index.attr,
>> +	&auth_level.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group auth_attr_group =3D {
>> +	.is_visible =3D auth_attr_is_visible,
>> +	.attrs =3D auth_attrs,
>> +};
>> +__ATTRIBUTE_GROUPS(auth_attr);
>> +
>> +static void tlmi_pwd_setting_release(struct kobject *kobj)
>> +{
>> +	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>> +
>> +	kfree(setting);
>> +}
>> +
>> +static const struct kobj_type tlmi_pwd_setting_ktype =3D {
>> +	.release        =3D &tlmi_pwd_setting_release,
>> +	.sysfs_ops	=3D &kobj_sysfs_ops,
>> +	.default_groups =3D auth_attr_groups,
>> +};
>> +
>> +/* ---- Attribute sysfs --------------------------------------------=
------------- */
>> +
>> +static ssize_t display_name_show(struct kobject *kobj, struct kobj_a=
ttribute *attr,
>> +				 char *buf)
>> +{
>> +	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> +
>> +	return sysfs_emit(buf, "%s\n", setting->display_name);
>> +}
>> +
>> +static ssize_t current_value_show(struct kobject *kobj, struct kobj_=
attribute *attr, char *buf)
>> +{
>> +	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> +
>> +	return sysfs_emit(buf, "%s\n", setting->current_value);
>> +}
>> +
>> +static ssize_t possible_values_show(struct kobject *kobj, struct kob=
j_attribute *attr, char *buf)
>> +{
>> +	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> +
>> +	return sysfs_emit(buf, "%s\n", setting->possible_values);
>> +}
>> +
>> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute=
 *attr,
>> +			 char *buf)
>> +{
>> +	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> +
>> +	if (setting->possible_values) {
>> +		/* Figure out what setting type is as BIOS does not return this */
>> +		if (strchr(setting->possible_values, ';'))
>> +			return sysfs_emit(buf, "enumeration\n");
>> +	}
>> +	/* Anything else is going to be a string */
>> +	return sysfs_emit(buf, "string\n");
>> +}
>> +
>> +static ssize_t current_value_store(struct kobject *kobj,
>> +				   struct kobj_attribute *attr,
>> +				   const char *buf, size_t count)
>> +{
>> +	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> +	size_t arglen, namelen, valuelen;
>> +	char *argbuf =3D NULL, *start;
>> +	char *new_setting =3D NULL;
>> +	int ret =3D -EINVAL;
>> +	int ix =3D 0;
>> +
>> +	if (!tlmi_priv.can_set_bios_settings)
>> +		return -EOPNOTSUPP;
>> +
>> +	/* If a save has been done then a reboot is needed */
>> +	if (tlmi_priv.reboot_required)
>> +		return -EPERM;
>> +
>> +	/* Strip out CR if one is present */
>> +	new_setting =3D kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
>> +	if (!new_setting)
>> +		return -ENOMEM;
>> +
>> +	/* Use lock in case multiple WMI operations needed */
>> +	guard(mutex)(&tlmi_lock);
>> +
>> +	/* Calculate and alloc buffer for command string */
>> +	namelen =3D wmi_calculate_string_buffer(setting->name);
>> +	valuelen =3D wmi_calculate_string_buffer(new_setting);
>> +	arglen =3D namelen + valuelen;
>> +	argbuf =3D kzalloc(arglen, GFP_KERNEL);
>> +	if (!argbuf) {
>> +		ret =3D -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	/* build argument buffer from inputs */
>> +	start =3D argbuf;
>> +	ix =3D wmi_populate_string_buffer(start, namelen, setting->name);
>> +	if (ix < 0)
>> +		goto out;
>> +	start +=3D ix;
>> +	ix =3D wmi_populate_string_buffer(start, valuelen, new_setting);
>> +	if (ix < 0)
>> +		goto out;
>> +	start +=3D ix;
>> +
>> +	ret =3D tlmi_simple_call(LENOVO_BIOS_CONFIGURATION_GUID, 0, SET_ID,=
 argbuf, arglen, NULL);
>> +	if (ret)
>> +		goto out;
>> +
>> +	tlmi_priv.save_required =3D true;
>> +
>> +out:
>> +	kfree(argbuf);
>> +	kfree(new_setting);
>
> __free() here too.
>
>> +	return ret ?: count;
>> +}
>> +
>> +static struct kobj_attribute attr_display_name =3D __ATTR_RO(display=
_name);
>> +
>> +static struct kobj_attribute attr_possible_values =3D __ATTR_RO(poss=
ible_values);
>> +
>> +static struct kobj_attribute attr_current_val =3D __ATTR_RW_MODE(cur=
rent_value, 0600);
>> +
>> +static struct kobj_attribute attr_type =3D __ATTR_RO(type);
>> +
>> +static struct attribute *tlmi_attrs[] =3D {
>> +	&attr_display_name.attr,
>> +	&attr_current_val.attr,
>> +	&attr_possible_values.attr,
>> +	&attr_type.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group tlmi_attr_group =3D {
>> +	.attrs =3D tlmi_attrs,
>> +};
>> +__ATTRIBUTE_GROUPS(tlmi_attr);
>> +
>> +static void tlmi_release_setting(struct tlmi_attr_setting *setting)
>> +{
>> +	if (setting) {
>> +		kfree(setting->name);
>> +		kfree(setting->display_name);
>> +		kfree(setting->possible_values);
>> +		kfree(setting->current_value);
>> +		kfree(setting->factory_default);
>> +		kfree(setting);
>> +	}
>> +}
>> +
>> +static void tlmi_attr_setting_release(struct kobject *kobj)
>> +{
>> +	tlmi_release_setting(to_tlmi_attr_setting(kobj));
>> +}
>> +
>> +static const struct kobj_type tlmi_attr_setting_ktype =3D {
>> +	.release        =3D &tlmi_attr_setting_release,
>> +	.sysfs_ops	=3D &kobj_sysfs_ops,
>> +	.default_groups =3D tlmi_attr_groups,
>> +};
>> +
>> +/* ---- Initialisation ---------------------------------------------=
------------ */
>> +
>> +static int tlmi_setting(struct wmi_device *wdev, int item)
>> +{
>> +	struct tlmi_attr_setting *setting;
>> +	union acpi_object *obj;
>> +
>> +	obj =3D wmidev_block_query(wdev, item);
>> +	if (!obj)
>> +		return -EIO;
>> +
>> +	if (obj->type !=3D ACPI_TYPE_PACKAGE) {
>> +		kfree(obj);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Confirm we have a valid item */
>> +	if (!obj->package.elements[0].string.pointer[0]) {
>> +		kfree(obj);
>> +		return 0;
>> +	}
>> +
>> +	setting =3D kzalloc_obj(*setting);
>> +	if (!setting) {
>> +		kfree(obj);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	setting->wdev =3D wdev;
>> +	setting->index =3D item;
>> +	setting->name =3D kstrdup(obj->package.elements[0].string.pointer, =
GFP_KERNEL);
>> +	setting->current_value =3D kstrdup(obj->package.elements[1].string.=
pointer, GFP_KERNEL);
>> +	setting->possible_values =3D kstrdup(obj->package.elements[2].strin=
g.pointer, GFP_KERNEL);
>> +	setting->factory_default =3D kstrdup(obj->package.elements[3].strin=
g.pointer, GFP_KERNEL);
>> +	setting->display_name =3D kstrdup(obj->package.elements[5].string.p=
ointer, GFP_KERNEL);
>
> And what if these fail???
>
>> +	setting->access_level =3D obj->package.elements[6].integer.value;
>> +	setting->read_only =3D obj->package.elements[7].integer.value ? tru=
e : false;
>> +	tlmi_priv.setting[item] =3D setting;
>> +
>> +	kfree(obj);
>
> __free()
>
>> +	return 0;
>> +}
>> +
>> +static void tlmi_release_attr(void)
>> +{
>> +	struct kobject *pos, *n;
>> +
>> +	/* Attribute structures */
>> +	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.=
attr);
>> +	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &save_settings.a=
ttr);
>> +
>> +	list_for_each_entry_safe(pos, n, &tlmi_priv.attribute_kset->list, e=
ntry)
>> +		kobject_put(pos);
>> +
>> +	kset_unregister(tlmi_priv.attribute_kset);
>> +
>> +	/* Authentication structures */
>> +	list_for_each_entry_safe(pos, n, &tlmi_priv.authentication_kset->li=
st, entry)
>> +		kobject_put(pos);
>> +
>> +	kset_unregister(tlmi_priv.authentication_kset);
>> +}
>> +
>> +static int tlmi_validate_setting_name(struct kset *attribute_kset, c=
har *name)
>> +{
>> +	struct kobject *duplicate;
>> +
>> +	if (!strcmp(name, "Reserved"))
>> +		return -EINVAL;
>> +
>> +	duplicate =3D kset_find_obj(attribute_kset, name);
>> +	if (duplicate) {
>> +		/* kset_find_obj() returns a reference */
>> +		kobject_put(duplicate);
>> +		return -EBUSY;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int tlmi_sysfs_init(void)
>> +{
>> +	int i, ret;
>> +
>> +	tlmi_priv.class_dev =3D device_create(&firmware_attributes_class, N=
ULL, MKDEV(0, 0),
>> +					    NULL, "%s", "thinklmi");
>> +	if (IS_ERR(tlmi_priv.class_dev)) {
>> +		ret =3D PTR_ERR(tlmi_priv.class_dev);
>> +		goto fail_class_created;
>> +	}
>> +
>> +	tlmi_priv.attribute_kset =3D kset_create_and_add("attributes", NULL,
>> +						       &tlmi_priv.class_dev->kobj);
>> +	if (!tlmi_priv.attribute_kset) {
>> +		ret =3D -ENOMEM;
>> +		goto fail_device_created;
>> +	}
>> +
>> +	tlmi_priv.authentication_kset =3D kset_create_and_add("authenticati=
on", NULL,
>> +							    &tlmi_priv.class_dev->kobj);
>> +	if (!tlmi_priv.authentication_kset) {
>> +		kset_unregister(tlmi_priv.attribute_kset);
>> +		ret =3D -ENOMEM;
>> +		goto fail_device_created;
>> +	}
>> +
>> +	for (i =3D 0; i < TLMI_SETTINGS_COUNT; i++) {
>> +		/* Check if index is a valid setting - skip if it isn't */
>> +		if (!tlmi_priv.setting[i])
>> +			continue;
>> +
>> +		/* check for duplicate or reserved values */
>> +		if (tlmi_validate_setting_name(tlmi_priv.attribute_kset,
>> +					       tlmi_priv.setting[i]->name) < 0) {
>> +			tlmi_release_setting(tlmi_priv.setting[i]);
>> +			tlmi_priv.setting[i] =3D NULL;
>> +			continue;
>> +		}
>> +
>> +		/* Build attribute */
>> +		tlmi_priv.setting[i]->kobj.kset =3D tlmi_priv.attribute_kset;
>> +		ret =3D kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_at=
tr_setting_ktype,
>> +					   NULL, "%s", tlmi_priv.setting[i]->name);
>> +		if (ret)
>> +			goto fail_create_attr;
>> +	}
>> +
>> +	ret =3D sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &pending=
_reboot.attr);
>> +	if (ret)
>> +		goto fail_create_attr;
>> +
>> +	ret =3D sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &save_se=
ttings.attr);
>> +	if (ret)
>> +		goto fail_create_attr;
>> +
>> +	/* Create authentication entries */
>> +	tlmi_priv.pwd_admin->kobj.kset =3D tlmi_priv.authentication_kset;
>> +	ret =3D kobject_init_and_add(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_=
setting_ktype,
>> +				   NULL, "%s", "Admin");
>> +	if (ret)
>> +		goto fail_create_attr;
>> +
>> +	tlmi_priv.pwd_power->kobj.kset =3D tlmi_priv.authentication_kset;
>> +	ret =3D kobject_init_and_add(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_=
setting_ktype,
>> +				   NULL, "%s", "Power-on");
>> +	if (ret)
>> +		goto fail_create_attr;
>> +
>> +	tlmi_priv.pwd_system->kobj.kset =3D tlmi_priv.authentication_kset;
>> +	ret =3D kobject_init_and_add(&tlmi_priv.pwd_system->kobj, &tlmi_pwd=
_setting_ktype,
>> +				   NULL, "%s", "System");
>> +	if (ret)
>> +		goto fail_create_attr;
>> +
>> +	tlmi_priv.pwd_hdd->kobj.kset =3D tlmi_priv.authentication_kset;
>> +	ret =3D kobject_init_and_add(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_se=
tting_ktype,
>> +				   NULL, "%s", "HDD");
>> +	if (ret)
>> +		goto fail_create_attr;
>> +
>> +	tlmi_priv.pwd_nvme->kobj.kset =3D tlmi_priv.authentication_kset;
>> +	ret =3D kobject_init_and_add(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_s=
etting_ktype,
>> +				   NULL, "%s", "NVMe");
>> +	if (ret)
>> +		goto fail_create_attr;
>> +
>> +	return ret;
>> +
>> +fail_create_attr:
>> +	tlmi_release_attr();
>
> Dan will have something unpretty to say about this style of error hand=
ling=20
> / rollback.
>

OK - I'll look at this in the new version and do something better.

>> +fail_device_created:
>> +	device_unregister(tlmi_priv.class_dev);
>> +fail_class_created:
>
> Why you have this label?
>
left over from v1 code that I missed cleaning-up. It's gone in the next =
version I'm working on.

>> +	return ret;
>> +}
>> +
>> +static struct tlmi_pwd_setting *tlmi_create_auth(enum pwd_type_v2 ty=
pe,
>> +						 const char *pwd_role)
>> +{
>> +	struct tlmi_pwd_setting *new_pwd;
>> +
>> +	new_pwd =3D kzalloc_obj(*new_pwd);
>> +	if (!new_pwd)
>> +		return NULL;
>> +
>> +	new_pwd->type_v2 =3D type;
>> +	new_pwd->role =3D pwd_role;
>> +	new_pwd->minlen =3D tlmi_priv.pwdcfg_v2.minlen;
>> +	new_pwd->maxlen =3D tlmi_priv.pwdcfg_v2.maxlen;
>> +	new_pwd->index =3D 0;
>> +
>> +	return new_pwd;
>> +}
>> +
>> +/* Get password settings from BIOS */
>> +static int tlmi_get_pwd_settings(void)
>> +{
>> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>> +	const union acpi_object *obj;
>> +	acpi_status status;
>> +
>> +	if (!tlmi_priv.can_get_password_settings)
>> +		return -EOPNOTSUPP;
>> +
>> +	status =3D wmi_query_block(LENOVO_BIOS_ACCESS_DATA_GUID, 0, &output=
);
>> +	if (ACPI_FAILURE(status))
>> +		return -EIO;
>> +
>> +	obj =3D output.pointer;
>> +	if (!obj)
>> +		return -ENOMEM;
>> +
>> +	if (obj->type !=3D ACPI_TYPE_PACKAGE) {
>> +		kfree(obj);
>> +		return -EIO;
>> +	}
>> +
>> +	tlmi_priv.pwdcfg_v2.password_state =3D obj->package.elements[0].int=
eger.value;
>> +	tlmi_priv.pwdcfg_v2.minlen =3D obj->package.elements[1].integer.val=
ue;
>> +	tlmi_priv.pwdcfg_v2.maxlen =3D obj->package.elements[2].integer.val=
ue;
>> +	tlmi_priv.pwdcfg_v2.strong_password =3D obj->package.elements[3].in=
teger.value;
>> +	tlmi_priv.pwdcfg_v2.supported_encodings =3D obj->package.elements[4=
].integer.value;
>> +	tlmi_priv.pwdcfg_v2.supported_keyboard =3D obj->package.elements[5]=
.integer.value;
>> +	tlmi_priv.pwdcfg_v2.hdd_user_password =3D obj->package.elements[6].=
integer.value;
>> +	tlmi_priv.pwdcfg_v2.hdd_master_password =3D obj->package.elements[7=
].integer.value;
>> +	tlmi_priv.pwdcfg_v2.nvme_user_password =3D obj->package.elements[8]=
.integer.value;
>> +	tlmi_priv.pwdcfg_v2.nvme_master_password =3D obj->package.elements[=
9].integer.value;
>> +	tlmi_priv.pwdcfg_v2.deploy_mode =3D obj->package.elements[10].integ=
er.value;
>> +	tlmi_priv.pwdcfg_v2.sys_mgr_pwd_ctrl =3D obj->package.elements[11].=
integer.value;
>> +	tlmi_priv.pwdcfg_v2.power_on_pwd_ctrl =3D obj->package.elements[12]=
.integer.value;
>> +	tlmi_priv.pwdcfg_v2.storage_pwd_ctrl =3D obj->package.elements[13].=
integer.value;
>> +	tlmi_priv.pwdcfg_v2.sys_mgr_setup_ctrl =3D obj->package.elements[14=
].integer.value;
>> +
>> +	if (WARN_ON(tlmi_priv.pwdcfg_v2.maxlen >=3D TLMI_PWD_BUFSIZE))
>> +		tlmi_priv.pwdcfg_v2.maxlen =3D TLMI_PWD_BUFSIZE - 1;
>> +
>> +	tlmi_priv.pwd_admin =3D tlmi_create_auth(SVP, "bios-admin");
>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SVP_PWD)
>> +		tlmi_priv.pwd_admin->pwd_enabled =3D true;
>> +
>> +	tlmi_priv.pwd_power =3D tlmi_create_auth(POP, "power-on");
>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_POP_PWD)
>> +		tlmi_priv.pwd_power->pwd_enabled =3D true;
>> +
>> +	tlmi_priv.pwd_system =3D tlmi_create_auth(SMP, "system");
>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SMP_PWD)
>> +		tlmi_priv.pwd_system->pwd_enabled =3D true;
>> +
>> +	tlmi_priv.pwd_hdd =3D tlmi_create_auth(HDD1, "hdd");
>> +	tlmi_priv.pwd_hdd->index =3D 1;
>> +	if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
>> +	    tlmi_priv.pwdcfg.ext.hdd_master_password) {
>> +		tlmi_priv.pwd_hdd->pwd_enabled =3D true;
>> +		if (tlmi_priv.pwdcfg.ext.hdd_master_password)
>> +			tlmi_priv.pwd_hdd->index =3D
>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_master_password) - 1;
>> +		else
>> +			tlmi_priv.pwd_hdd->index =3D
>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>> +	}
>> +
>> +	tlmi_priv.pwd_nvme =3D tlmi_create_auth(NVME1, "nvme");
>> +	tlmi_priv.pwd_nvme->index =3D 1;
>> +	if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>> +	    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>> +		tlmi_priv.pwd_nvme->pwd_enabled =3D true;
>> +		if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>> +			tlmi_priv.pwd_nvme->index =3D
>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_master_password) - 1;
>> +		else
>> +			tlmi_priv.pwd_nvme->index =3D
>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_user_password) - 1;
>> +	}
>> +
>> +	kfree(obj);
>
> __free()
>
>> +	return 0;
>> +}
>> +
>> +static int tlmi_analyze(struct wmi_device *wdev)
>> +{
>> +	int i, ret;
>> +
>> +	if (wmi_has_guid(LENOVO_BIOS_CONFIGURATION_GUID))
>> +		tlmi_priv.can_set_bios_settings =3D true;
>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_DATA_GUID))
>> +		tlmi_priv.can_get_password_settings =3D true;
>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_GUID)) {
>> +		tlmi_priv.can_set_bios_password =3D true;
>> +		tlmi_priv.certificate_support =3D true;
>> +	}
>> +
>> +	/*
>> +	 * Try to find the number of valid settings of this machine
>> +	 * and use it to create sysfs attributes.
>> +	 */
>> +	for (i =3D 0; i < TLMI_SETTINGS_COUNT - 1; ++i) {
>> +		tlmi_priv.setting[i] =3D NULL;
>> +		ret =3D tlmi_setting(wdev, i);
>> +		if (ret)
>> +			goto fail_clear_attr;
>> +	}
>> +
>> +	/* Probe and create password setting structure */
>> +	ret =3D tlmi_get_pwd_settings();
>> +	if (ret)
>> +		goto fail_clear_attr;
>> +
>> +	return 0;
>> +
>> +fail_clear_attr:
>> +	for (i =3D 0; i < TLMI_SETTINGS_COUNT; ++i) {
>> +		if (tlmi_priv.setting[i])
>> +			tlmi_release_setting(tlmi_priv.setting[i]);
>> +	}
>> +	kfree(tlmi_priv.pwd_admin);
>> +	kfree(tlmi_priv.pwd_power);
>> +	kfree(tlmi_priv.pwd_system);
>> +	kfree(tlmi_priv.pwd_hdd);
>> +	kfree(tlmi_priv.pwd_nvme);
>> +
>> +	return ret;
>> +}
>> +
>> +void tlmi_v2_remove(struct wmi_device *wdev)
>> +{
>> +	if (tlmi_initialised) {
>> +		tlmi_release_attr();
>> +		device_unregister(tlmi_priv.class_dev);
>> +		tlmi_initialised =3D false;
>> +	}
>> +}
>> +EXPORT_SYMBOL(tlmi_v2_remove);
>> +
>> +int tlmi_v2_initialise(struct wmi_device *wdev, const void *context)
>> +{
>> +	int ret;
>> +
>> +	ret =3D tlmi_analyze(wdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D tlmi_sysfs_init();
>> +	tlmi_initialised =3D true;
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(tlmi_v2_initialise);
>
> Please use a namespace.
>
Will do (I do have that in the new version I'm working on)

>> +
>> +MODULE_AUTHOR("Mark Pearson <mpearson-lenovo@squebb.ca>");
>> +MODULE_DESCRIPTION("ThinkLMI V2 Driver");
>> +MODULE_LICENSE("GPL");
>> +
>> diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platfo=
rm/x86/lenovo/think-lmi.c
>> index da1e54dab2d1..a00d479e9fc2 100644
>> --- a/drivers/platform/x86/lenovo/think-lmi.c
>> +++ b/drivers/platform/x86/lenovo/think-lmi.c
>> @@ -32,7 +32,10 @@ static void tlmi_remove(struct wmi_device *wdev)
>>  		tlmi_v1_remove(wdev);
>>  		break;
>>  	case 2:
>> -		pr_err("Not yet implemented\n");
>> +		tlmi_v2_remove(wdev);
>> +		break;
>> +	default:
>> +		pr_err("Unsupported version %d\n", tlmi_version);
>>  	}
>>  }
>> =20
>> @@ -64,8 +67,8 @@ static int tlmi_probe(struct wmi_device *wdev, cons=
t void *context)
>>  		ret =3D tlmi_v1_initialise(wdev, context);
>>  		break;
>>  	case 2:
>> -		pr_err("Not yet implemented\n");
>> -		return -EOPNOTSUPP;
>> +		ret =3D tlmi_v2_initialise(wdev, context);
>> +		break;
>>  	default:
>>  		return -EINVAL;
>>  	}
>> diff --git a/drivers/platform/x86/lenovo/think-lmi.h b/drivers/platfo=
rm/x86/lenovo/think-lmi.h
>> index fd8a98c2fdaa..1883493cf435 100644
>> --- a/drivers/platform/x86/lenovo/think-lmi.h
>> +++ b/drivers/platform/x86/lenovo/think-lmi.h
>> @@ -81,6 +81,55 @@ struct tlmi_pwdcfg {
>>  	struct tlmi_pwdcfg_ext ext;
>>  };
>> =20
>> +/* For think_lmi_v2 only */
>> +enum pwd_type_v2 {
>> +	SVP =3D 0,
>> +	SMP,
>> +	POP,
>> +	HDD1,
>> +	HDD2,
>> +	HDD3,
>> +	HDD4,
>> +	NVME1,
>> +	NVME2,
>> +	NVME3,
>> +	NVME4,
>> +	NVME5,
>> +	NVME6,
>> +	NVME7,
>> +	NVME8,
>> +	MASTERHDD1,
>> +	MASTERHDD2,
>> +	MASTERHDD3,
>> +	MASTERHDD4,
>> +	MASTERNVME1,
>> +	MASTERNVME2,
>> +	MASTERNVME3,
>> +	MASTERNVME4,
>> +	MASTERNVME5,
>> +	MASTERNVME6,
>> +	MASTERNVME7,
>> +	MASTERNVME8,
>> +};
>> +
>> +struct tlmi_pwdcfg_v2 {
>> +	unsigned int password_state;
>> +	unsigned int minlen;
>> +	unsigned int maxlen;
>> +	bool strong_password;
>> +	unsigned int supported_encodings;
>> +	unsigned int supported_keyboard;
>> +	unsigned int hdd_user_password;
>> +	unsigned int hdd_master_password;
>> +	unsigned int nvme_user_password;
>> +	unsigned int nvme_master_password;
>> +	bool deploy_mode;
>> +	bool sys_mgr_pwd_ctrl;
>> +	bool power_on_pwd_ctrl;
>> +	bool storage_pwd_ctrl;
>> +	bool sys_mgr_setup_ctrl;
>> +};
>> +
>>  /* password setting details */
>>  struct tlmi_pwd_setting {
>>  	struct kobject kobj;
>> @@ -97,6 +146,7 @@ struct tlmi_pwd_setting {
>>  	bool cert_installed;
>>  	char *signature;
>>  	char *save_signature;
>> +	enum pwd_type_v2 type_v2;
>>  };
>> =20
>>  /* Attribute setting details */
>> @@ -107,6 +157,12 @@ struct tlmi_attr_setting {
>>  	char *name;
>>  	char *display_name;
>>  	char *possible_values;
>> +	char *current_value;
>> +	/* v2 fields */
>> +	char *factory_default;
>> +	char *user_default;
>> +	unsigned char access_level;
>> +	bool read_only;
>>  };
>> =20
>>  struct think_lmi {
>> @@ -131,6 +187,7 @@ struct think_lmi {
>>  	struct kset *authentication_kset;
>> =20
>>  	struct tlmi_pwdcfg pwdcfg;
>> +	struct tlmi_pwdcfg_v2 pwdcfg_v2;
>>  	struct tlmi_pwd_setting *pwd_admin;
>>  	struct tlmi_pwd_setting *pwd_power;
>>  	struct tlmi_pwd_setting *pwd_system;
>> @@ -142,5 +199,7 @@ struct think_lmi {
>> =20
>>  void tlmi_v1_remove(struct wmi_device *wdev);
>>  int tlmi_v1_initialise(struct wmi_device *wdev, const void *context);
>> +void tlmi_v2_remove(struct wmi_device *wdev);
>> +int tlmi_v2_initialise(struct wmi_device *wdev, const void *context);
>> =20
>>  #endif /* !_THINK_LMI_H_ */
>>=20
>
> --=20
>  i.

Thanks for the review. All the pointers are really helpful.

The series itself is getting completely rewritten based on Armin's feedb=
ack. I'll integrate your points above for the new series.

Mark

