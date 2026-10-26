Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015153;
	b=ZVtecXPwTMI7544A6K7JOaCq2HAC5rPjsX/N/f/LCQ68ZbyVXIZ8p6EOOHK+79WtcrCP
	 LDTWD7T7X9rV6qN1eDBW8QEKmjRkhL+lUYXN7gkuu0d+XlkxD+w2ZgJOSh1/sBBsfQm3u
	 gWUIkdMbyQCVe87ihdHc3JdLA16DIV41kbRUY1FwfbI0a3Q80LzlKAY8kGrYtMn4rbuXJ
	 //js0FAqm7wFlTesi/g1INEklDfnIM5rpfqDSEX7fqzvGckOMwGN1/U/GZUTUQsk+HhtG
	 ouMxx446ovXB92p4Ar3hHrUSyxlJgQRi/61oNSBxq3tUkQX0SZjmHPntvvYTeHiqT9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015153;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/7KsSSyN4VyW8KfEr2T7xGdHDFQp8fStSXcEPnKWN+U=;
	b=jegtsXxhDYq7clknLI3PQMBvM36rJilEBsdUF+DoVAM9tzcbhU8SeA9o8Hvbb/L45Kru
	 l6ymgD2Tr+9XQhHTxKWmhJ0JT0NjWfIxSd3+ppgF/oSI4HVxnhesI5ELTOOKgnJ3tq+5d
	 HExVoqCedaWdRznojSX77sy2Sr6UIYOO0egmwlYzTRBnU0HBsZmAZ96CeXekmY7zVptEl
	 30i4DUuv7/2hhydiX3Q9lL3n2QeTxtySIbgOcsYzMK+fFjXkWEZ7pfALnAeN3isukr3Ho
	 t6TslDKpUkkqa9hJebs+6PuOAXFZiQQOWw53LEInXZPenKi6CR2A1Ep69TWMoXLTJwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMy42Ydk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3D7606A31E;
	Mon, 26 Oct 2026 11:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMy42Ydk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72D11F01828;
	Mon, 26 Oct 2026 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793015152;
	bh=/7KsSSyN4VyW8KfEr2T7xGdHDFQp8fStSXcEPnKWN+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oMy42YdkrBUxQs6B9UIudU/VtbOSCROPlHkb7UWLJQG6XGLMf8lbZ8wkW9ps3zzn2
	 uLJxJExF27yqGg1DWsmU6wDYurhS3taxFHAsFRCbCCCyOFCIq09PBS1rSxMt+RKtbg
	 MievsLdzkYoWTzCRShdFRAJrT//CzkdcLrq1Hmqc1/DYd7Un8tFeR8Bq8a76Rx53jx
	 GjHDcWGbGQlOeaVZoad1JcM9xUMdUamGtu8CqubfKpgqTODoaYXYO1/r83YLu93yTY
	 szrO73uo8oLJI+IFU57tHrBaSqyB+wOnc3WBFPI8WMNnBKU8b0O3W/+2oRJ2j4QB+7
	 8HB/rZLJrCakA==
Message-ID: <073e6aaa-12dd-4fc1-b7dd-4d27cb4e27b6@kernel.org>
Date: Mon, 26 Oct 2026 12:45:48 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 RESEND 0/6] Merge redmi-wmi into bitland-mifs-wmi
To: Mingyou Chen <qby140326@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>, platform-driver-x86@vger.kernel.org,
 ted eric <ericted8810@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
 linux-kernel@vger.kernel.org, Chris Taraszka <chris@miget.com>,
 Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/ig==?=
 =?UTF-8?B?5paH?= <btx342@gmail.com>, powerfullz <wleizc7319@gmail.com>,
 =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>,
 =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe
 <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>,
 Serhiy Shliapuhin <shlyapugin@gmail.com>
References: <20261026102101.224568-1-qby140326@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261026102101.224568-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-Oct-26 11:20 AM, Mingyou Chen wrote:
> This patch series consolidates the standalone 'redmi-wmi' driver into the
> 'bitland-mifs-wmi' driver to eliminate code duplication and centralize
> the maintenance of overlapping ACPI WMI event streams.

<snip>

> And I've got a question, from sashiko's comment in my v12
> 
> https://sashiko.dev/#/patchset/20261012133648.132363-1-qby140326%40gmail.com
> 
>> Will this result in the loss of KEY_PERFORMANCE events on event-only legacy
>> devices?
>> Looking at bitland_mifs_wmi_probe() in drivers/platform/x86/bitland-mifs-wmi.c,
>> if dev_type == BITLAND_WMI_EVENT, it returns early after registering the input
>> device:
>> 	if (dev_type == BITLAND_WMI_EVENT) {
>> 		/* Register input device for hotkeys */
>> 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
>> 		...
>> 		return input_register_device(drv_data->input_dev);
>> 	}
>> When the performance key is pressed, bitland_mifs_wmi_notify() intercepts it,
>> invokes the bitland_notifier_list, and returns without reporting an input event:
>> 	case WMI_EVENT_PERFORMANCE_PLAN:
>> 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
>> 		blocking_notifier_call_chain(&bitland_notifier_list,
>> 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
>> 					     NULL);
>> 		return;
>> Because the platform profile and notifier were not registered during probe
>> for event-only devices, does this mean the events are silently dropped instead
>> of emitting KEY_PERFORMANCE like the old driver did?
> 
> I ackknowledged that KEY_PERFORMANCE (WMI_EVENT_PERFORMANCE_PLAN_ALT in
> bitland-mifs-wmi) looks like an event in this LKML thread
> 
>> Since the event reports a change that has already happened,
>> platform_profile_notify() is the natural way to pass it on, as
>> suggested in my v6 reply: power-profiles-daemon then re-reads the
>> profile, which is harmless after the driver's own writes too. If
>> KEY_PERFORMANCE should stay for on-screen displays (Ibragim asked to
>> keep these events observable), it may be worth not reporting it for the
>> event that echoes the driver's own write, or at least saying in a
>> comment that it reports a mode change that already happened. On
>> Ibragim's TM2209 the profile SET is reported not to work [3], so there
>> 0x16 can only come from Fn+K and the echo does not exist; Ibragim, can
>> you confirm?
> 
> https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/
> 
> So should I follow sashiko's advice?

Copy and pasting my v13 reply about this here to make sure it gets seen:

What I think should happen here is that *if* there is a platform-profile-handler,
then platform_profile_notify() should be used (1). OTOH if there is no
platform-profile-handler (the mentioned event-only mode) then reporting this
to userspace as KEY_PERFORMANCE as was done before makes sense to me.

Does that sound reasonable?

Regards,

Hans



1) This assumes the event indicates a platform-profile-change has happened, if
it is a request for a platform-profile-change then platform_profile_cycle();
should be used instead.


