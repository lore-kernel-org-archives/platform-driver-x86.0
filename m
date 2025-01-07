Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3B11EB9F4
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jan 2025 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736251599; cv=none; b=fl4UHbv1u4NWIKTMQz3XY3Kt3taBMaQB0GF0YsULwx39enOBj9G9shDIuI56RYQwGIeTYG3mzbammY8eBzSlUVkL2ovgLXa5WJMVv0khGxjrBErQTcP+lpA4m90a7ZPl/1wF887HOVeV/7hx7SDLIFDsi3FOXEDWrHJQL9RmPjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736251599; c=relaxed/simple;
	bh=y87AZ/8NP9+Lzg058btA43aWcEyN1NP0BaKjQl095/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChcsymJMkpTT0L8F70aRfESq1rH9V01GcI4IM9aAasqkQp9vjN2TtqmAhXoLGng1AfY4MKp9uJSPlL6wVr5KxAV8HqnzraJ/k9y62o0WYItMtGBaBpYNIOMfrrRnr8WSTPvEStaLnqOcdB7eJM5QR2PP1XrrjR5gVIvMuygSCaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dby1wCm9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dby1wCm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736251595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ywZTa74FPTmgZMpboBIHui9ayj6w9MDkwYSe6G0OT1s=;
	b=dby1wCm9T3nsBdmmnPld2HXDwo49dM55RLwNwJwJuG1wpc2AkR6kFO/Op7I5S/oGf52Ahp
	wX72pyxH+w6jmuP/0BYwTyMY9l/ivdWmXrSgDe+JBqp9qxTZBN2yUXRo9fbe2Kuq4wbEYi
	GE/AEHrT7yDA4URAwX5LjNV+tXb3ebU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-fWEYKaFAMpmvHaSBX5X8sg-1; Tue, 07 Jan 2025 07:06:35 -0500
X-MC-Unique: fWEYKaFAMpmvHaSBX5X8sg-1
X-Mimecast-MFC-AGG-ID: fWEYKaFAMpmvHaSBX5X8sg
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aaf921b8a85so493068166b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jan 2025 04:06:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736251593; x=1736856393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywZTa74FPTmgZMpboBIHui9ayj6w9MDkwYSe6G0OT1s=;
        b=QvXD+zAp9axCmXy6cor9Y/w8lCP9JbIF1hr45guS6zZ4NxRMzw3XXR2wQAKmj2ca8t
         vXg0dkZjHHgAt6VMdD6fx/GQHg6gDztxhfNTvA4T+AxEl7YVWjHuyWV36U7nc3dyuyTv
         O6iX/m2uFcxPsjQBsGK6BrnB1pYZO0d10zApxa2IuVIUC3xa/uH5cYtCa6jrEiMKjiX4
         78bz9F6196Gzia1QBC+RV5zK6BXj3njVYEKvRjVAhhzvDHlby+dZCC+99FiBlXHk38nq
         ZbfyqOac26hqc4KnQNoq94NWN0PWqfcfxOqSMlf6TCI5ORDurWA+xs+PO4Yv0JZJ/1Xq
         IyIg==
X-Forwarded-Encrypted: i=1; AJvYcCVjs3LQYEuJgWzxYGC+9nEZyyZIXC5/qvmvFltBTi6AMqzKtxRtnuolvYJG+ITBR0cKFyuaN4Ay1/xQCx/jG2uwRaiL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp7JmvgHkxpxG81UiU2IR035FvvzdGiwo4DCUNc4E9Z50A8WpK
	5s3qd9t+HpYQbA4yDr7rqRRJPdOe68khl8uaruJYClsrtUFqO93NP013QeFhQpFSSASHxeG94F+
	/hLfeA8R/WHC9v+0quDwThpEi4ZHlt7nB40aK7+y+duxoZAFRJSN51L/eNeN5FL9v5sT2yqTwmY
	PaZPYHZQ==
X-Gm-Gg: ASbGncsAYYGjWDHPvU1W+l/gyoNRZCEGhakWrlXF96cHMCJNv0caAr+fYPnt9tYrwcE
	yQQlPTP7qGSQQ/VtIpA7+5bJIlp2iTzfSmiXJkfVGAcWTrm+wrKZjMTq5YW2WxRd5vIe1Uu+T3W
	uFYkA+fIq2FaWVYeVIxb+zwC5PWrxNYIKhxIiuFgW2pIm8dluiR/zy4iLnxTMETJ4+xzoMAWFSw
	kwN/HOBilA3S2hRRhTIL0FYV32lKbqp7cuY+a4wrTNqqGY7rSYESfQVE1+ocd3SHNhq+G4x/AUX
	ddv/Q3ZeEDh6OlEHxk7MiUNw0BcUdKRmhu4XHyUgljAQW7L7YzwnkMuAPCHOEN1pudYeF0KlYg/
	EKmlPlfwJdt5JzwWYjxtBzLX8Glkab/o=
X-Received: by 2002:a17:907:a089:b0:aa6:8e61:669d with SMTP id a640c23a62f3a-aac289357e7mr4304064466b.9.1736251593364;
        Tue, 07 Jan 2025 04:06:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLUbli6VWn3070mb4PIpahkzszuBSZo7kmXVGXyc1RE0/IsFFFPwNF05NfRYGxDRGCCLdLmA==
X-Received: by 2002:a17:907:a089:b0:aa6:8e61:669d with SMTP id a640c23a62f3a-aac289357e7mr4304060666b.9.1736251592807;
        Tue, 07 Jan 2025 04:06:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06dea8sm2376650266b.192.2025.01.07.04.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:06:32 -0800 (PST)
Message-ID: <40254501-7448-4349-828b-834dd821740d@redhat.com>
Date: Tue, 7 Jan 2025 13:06:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de,
 platform-driver-x86@vger.kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241216103855.18457-1-josh@joshuagrisham.com>
 <13184052-baf2-4e7d-b8ef-9ba3f34d475a@t-8ch.de>
 <66897a27-5f81-46fc-898d-682456d7f37f@redhat.com>
 <CAMF+KeZ3uAWZuuPJcrrvTJS-TgyxkqXOY_w=wNw7eZQiUkV5YA@mail.gmail.com>
 <bfd9b7a4-ebef-49ff-8b86-bd61b1a06d38@redhat.com>
 <CAMF+KeZ2W27eL1KaCUFWPBQ=uc22NeEJKkYJrTYBef4buKd33A@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMF+KeZ2W27eL1KaCUFWPBQ=uc22NeEJKkYJrTYBef4buKd33A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Joshua,

On 7-Jan-25 12:36 PM, Joshua Grisham wrote:
> Den mån 6 jan. 2025 kl 12:50 skrev Hans de Goede <hdegoede@redhat.com>:
>>
>> Hi,
>>
>> Sorry for the very slow reply.
>>
> 
> Hi Hans, not to worry and appreciate that you take the time! I have
> been in good and capable hands with several eager and helpful
> reviewers who are helping to push me in the right direction :) I
> acknowledge everything from your message but will respond to only
> certain points below:
> 
>>> What exactly should they be named (any preference?)
>>
>> No preference for the naming, the firmware-attributes API just
>> specifies how userspace can find out if something is
>> an int/string/enumand valid values / range. Not naming of
>> the attributes.
>>
> 
> Now that I have had some time to get over jet lag and craziness from
> the last few weeks, I think this has finally sunk in and I am with you
> all on firmware-attributes :) I have decided to revert the naming a
> bit on what I had most recently called "camera_lens_cover" to what
> Samsung device users will be familiar with: "block_recording"; the
> rest of the attributes within the enumeration type group will exist so
> hopefully it will be pretty self-explanatory and also help to soothe
> some of the "unexpected side effects" confusion. It will still report
> SW_CAMERA_LENS_COVER to its own "Camera Lens Cover" input device, but
> the firmware-attribute itself under samsung-galaxybook will be called
> "block_recording".
> 
>>> Other notifications that I am wondering what the "right" way to handle
>>> / using the right interface:
>>>
>>> - Are there better events to use for these which these devices are
>>> reporting for "ACPI_NOTIFY_DEVICE_ON_TABLE" and
>>> "ACPI_NOTIFY_DEVICE_OFF_TABLE" , i.e. some kind of standard
>>> "switch"-like notification that the motion sensor in the device has
>>> detected that it has been placed or lifted from a flat surface?
>>
>> The thinkpad_apci driver has /sys/bus/platform/devices/thinkpad_acpi/dytc_lapmode
>> which will read 1 when the laptop thinks it is not on a table (and thus will
>> limit max temperatures a bit to avoid someone getting a hot lap when
>> actually having the laptop on their lap.
>>
>> I'm not aware of any other drivers having something similar. I do think
>> that power-profiles-daemon checks the dytc_lapmode thing, so it might
>> be good to have some standard interface for this, but that would need
>> to be designed / decided upon .
>>
>> For v1 of your patch I would just dev_dbg() log these events and
>> otherwise do nothing.
>>
> 
> What I have landed on here is to forward along / generate acpi netlink
> events against the platform driver name (samsung-galaxybook) for these
> events, so for now users should be able to use acpid or similar
> userspace tools if they really want to act on this, but otherwise
> nothing else is being done by the driver. Please let me know if this
> sounds like an ok approach or not and I can adjust accordingly. Also,
> of course, if there is a different direction in the future where a
> more formalized "userspace interface" for this is established, this
> can be changed!

Generating acpi netlink events for this sounds good to me.

>>> - When the battery charge control end threshold is reached, there is
>>> an ACPI notification on this device as well that is the one I have
>>> marked "ACPI_NOTIFY_BATTERY_STATE_CHANGED" -- the Samsung background
>>> apps pop up a custom OSD that basically says something to the effect
>>> that their "Battery saver is protecting the battery by stopping
>>> charging" (can't remember the exact verbiage) and they change the
>>> battery icon, but without doing anything else in my driver currently
>>> the battery still reports state of "charging" even though it just sits
>>> constantly at the percentage (and has the charging icon in GNOME etc).
>>> I have seen the event come and go occasionally when I did not expect
>>> it, but my working theory is that maybe it is if/when the battery
>>> starts charging again if it dips too far below the target "end
>>> threshold" and then notifies again when the threshold has been
>>> reached. Armin also mentioned this before in a different mail; I guess
>>> I would hope/expect there is an event or a function I could call to
>>> have the state reflected correctly but I would not want that it
>>> negatively impacts the normal behavior of charging the battery itself
>>> (just that the state/icon would change would be ideal! as it functions
>>> perfectly, it is just that the state and icon are not accurate).
>>
>> ATM there is no userspace API to communicate e.g. "charging stopped
>> due to charge end threshold" and this is the first time I hear about
>> us getting events from the hw for this.
>>
>> So for this one too I would say just dev_dbg() log the event and
>> otherwise do nothing.
>>
>> We can always add an API later if we have an idea how userspace
>> could / will use this.
>>
> 
> Similar to above is where I landed for this one as well: what I have
> done for now is forward along these notifications as acpi netlink
> events on samsung-galaxybook, so users should be able to see and act
> on them if they really want to, but otherwise they are completely
> "new" / custom events that should not disturb anything (and as said
> before, this can be changed later if/when any formalized userpace
> interface is established for this kind of notification event).

Same as above, generating acpi netlink events for this sounds good to me.

Regard,

Hans


