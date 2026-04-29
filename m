Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C7B3A382D;
	Wed, 29 Apr 2026 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777497595; cv=none; b=Ssru8DZXTe9utS3ezuHKMO0P4v5KB3z83rHKEzDHr8F9oZ9BAryLWWPjg/f5hV3dOV3gfp5ho6BkfBSRPqNEPl7Z0ij5ktdnIQ2eI1WJE2SgbtsXGH9gy4qqT9E/sne+NI9Eo6JA1FLlxyVvJXKt/XIT2C8sM0+TQQBoWwQ1I1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777497595; c=relaxed/simple;
	bh=EH7AR/FpQ+2kHmK+w1oObcROZY1OUk8MnBAyn5NS5gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlDxxmh/alYy+q6/CHo5kDCKwHhWetbDoNCqBb4dIFLe1QYYPT6aJ6c++tiHYGwkH7XEIPTtslz3SnOwLdgXt8vBfpyzf33oNuI8Ns3em+CzbG5SVEQHCILmwfqlv5DpSS8MdwuNUz4li5gGBy9ti+Cx+Y9XIJcsXfTW9UCGgSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TTIvQHil; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TTIvQHil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777497581; x=1778102381; i=w_armin@gmx.de;
	bh=0btCFwdYSkHfJPuJt7YrqBxqeQyGP8+TfBRkiwZSV88=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=TTIvQHilsFtR0bud8XqKjQrJ1IMqNWCOdqP+32mUo3bb0XRSKuXEcTVy50NtYfB6
	 5RAhYQD6qTZcIp2laZ7MbA7a1t3iPFk8OWKMMAY+PxzTinPZlpnLS3bqH9KYaKuMr
	 TQTLsozjLGJBUa36oWEflaQn2Ln/xqIW8wqEZw2GydqDHNoKG9dAurCWq2TuGAO6w
	 DS+wsi4x0VoCtOVCg64T1iVyeDyQy102tcTiP/OnnOVK7UfnwnrZEu/6ERw7xyM3J
	 lSTl6Fruf6xvU00h3pWOVprwOoafZQ9/ZxUr1bprXD3LVlDBsj07ld/6hHRQxlWTo
	 WPdKjxpuIC7hSARLjw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnps0-1vXXxW2nGc-00h8GB; Wed, 29
 Apr 2026 23:19:40 +0200
Message-ID: <f1bd031d-b6a6-44fe-b22e-c0d6ea5e5fb0@gmx.de>
Date: Wed, 29 Apr 2026 23:19:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: alienware-wmi-base: Transition to new
 WMI API
To: Kurt Borja <kuurtb@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20260428-aw-new-api-v4-1-d2c06241d7ad@gmail.com>
 <795321b2-3655-40ec-ae10-02b0db799df6@gmx.de>
 <DI5O65UZ12EU.1IC2SMB4DGNWA@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <DI5O65UZ12EU.1IC2SMB4DGNWA@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PkkWyUhjciXRrI2b+Hq1j7EvK9EY9W2XXrlZ+15mKdtG6rx0aS8
 +2tZdOCkDTmEJs19vJ+KxpwYX12g9sC4fcDVfcSKnlJmWWlHx2VobeFNq8TkAacL0Ld9gGP
 ViHs8lyPxLgyN3KexkwCABD0C0RKsLmCDgUJX8HUf3UB/rqqq9dwoB3YO9ugu6GJ5ytNRv+
 PnAgP2Y3qkopr6bM8MmZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0Zl4lC3XgTA=;Q0hVqfadMt1prjKz12CKNQukXL6
 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
 Q8r5kw==

Am 29.04.26 um 15:23 schrieb Kurt Borja:

> On Tue Apr 28, 2026 at 2:27 PM -05, Armin Wolf wrote:
>> Am 28.04.26 um 18:37 schrieb Kurt Borja:
>>
>>> Transition to the new wmi_buffer based WMI API.
>>>
>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>> ---
>>> v4:
>>>     - Rebase to use the new wmidev_invoke_method() with size check
>>>
>>> v3: https://patch.msgid.link/20260331-aw-new-api-v3-1-ef03b94529d8@gma=
il.com
>>>     - Use __free() instead of manual cleanup.
>>>     - Include <linux/types.h>
>>>
>>> v2: https://patch.msgid.link/20260331-aw-new-api-v2-1-3b0d33bf8d22@gma=
il.com
>>>     - Cast wmi_buffer data to __le32 and then use le32_to_cpu() before
>>>       returning
>>>
>>> v1: https://patch.msgid.link/20260330-aw-new-api-v1-1-95910bfa1b38@gma=
il.com
>>> ---
>>>    drivers/platform/x86/dell/alienware-wmi-base.c | 31 +++++++++++++++=
+----------
>>>    1 file changed, 19 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/=
platform/x86/dell/alienware-wmi-base.c
>>> index 64562b92314f..21d3acfbd73d 100644
>>> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
>>> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
>>> @@ -12,8 +12,13 @@
>>>    #include <linux/cleanup.h>
>>>    #include <linux/module.h>
>>>    #include <linux/platform_device.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/types.h>
>>>    #include <linux/dmi.h>
>>>    #include <linux/leds.h>
>>> +
>>> +#include <asm/byteorder.h>
>>> +
>>>    #include "alienware-wmi.h"
>>>   =20
>>>    MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
>>> @@ -150,21 +155,23 @@ u8 alienware_interface;
>>>    int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
>>>    			  void *in_args, size_t in_size, u32 *out_data)
>>>    {
>>> -	struct acpi_buffer out =3D {ACPI_ALLOCATE_BUFFER, NULL};
>>> -	struct acpi_buffer in =3D {in_size, in_args};
>>> -	acpi_status ret;
>>> +	struct wmi_buffer out, in =3D {
>>> +		.data =3D in_args,
>>> +		.length =3D in_size,
>>> +	};
>>> +	int ret;
>>>   =20
>>> -	ret =3D wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &=
out : NULL);
>>> -	if (ACPI_FAILURE(ret))
>>> -		return -EIO;
>>> -
>>> -	union acpi_object *obj __free(kfree) =3D out.pointer;
>>> +	if (out_data)
>>> +		ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, &out,
>>> +					   sizeof(*out_data));
>>> +	else
>>> +		ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, NULL, 0);
>>> +	if (ret)
>>> +		return ret;
>>>   =20
>>>    	if (out_data) {
>>> -		if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
>>> -			*out_data =3D (u32)obj->integer.value;
>>> -		else
>>> -			return -ENOMSG;
>>> +		__le32 *data __free(kfree) =3D out.data;
>>> +		*out_data =3D le32_to_cpu(*data);
>>>    	}
>> Hi,
>>
>> calling wmidev_invoke_method() with a NULL output buffer will likely le=
ad to crashes. This happens
>> because wmidev_invoke_method() demands that a valid pointer to a output=
 buffer is provided by the
>> caller. I suggest that you use wmidev_invoke_procedure() instead:
>>
>> 	__le32 *data __free(kfree) =3D NULL;
>>
>> 	if (!out_data)
>> 		return wmidev_invoke_procedure(wdev, 0, method_id, &in);
>>
>> 	ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, &out, sizeof(*da=
ta));
>> 	if (ret < 0)
>> 		return ret;
>>
>> 	result =3D out.data
>> 	...
> Hi Armin,
>
> You're right, I thought the only difference between _procedure and
> _method was the size check.
>
> Also, Sashiko [1] reported that out.data might be ZERO_SIZE_PTR even if
> wmidev_invoke_method() succeeds. I thought it was a false positive but I
> looked further and it was actually a bug. I submitted a fix for this.

Thank you, i will take a look at it immediately.

Thanks,
Armin Wolf

>
> [1] https://sashiko.dev/#/patchset/20260428-aw-new-api-v4-1-d2c06241d7ad=
%40gmail.com
>
