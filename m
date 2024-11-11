Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881151E481
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 14:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731335640; cv=none; b=KT3Ya/jvG4eX1IeelQnDs1wJ2Hxz9p9zbyju8UqU6DvcpDCFqm6RPkX5Q2gU5Erje0Ur/cK1OfiubGeGkTv1+hJzT3vpGzfGRiZumDQpu7zBL6k5rTqRJn7i+4aGpdY0bGJ4c0afFj2m5Gqvtw4KlXK5Xz6GrSpuIUNn1/zRuQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731335640; c=relaxed/simple;
	bh=imH7Wra/Q/VhKl6uoZL9x4dEWxtehMyrchME8L9ZfAE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ueACF4m10BS5lWUXIdjP0B+3wXSknwf6S6ALY5eVzzo7YBDy5hIjDZS/TfEXE/dQFHVhPHczgvIb2ttH9QeHjcO28nJoS/QjBgzVHDUUT+483+RXnDkFoMunlCBOaqQSK9JrVij+jcLueyPCZbVamNCUUObKjzwkiw2BZioYA58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SNiJUXxf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SNiJUXxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731335637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=imH7Wra/Q/VhKl6uoZL9x4dEWxtehMyrchME8L9ZfAE=;
	b=SNiJUXxfqDbkwYKvgnZGamrXvgQnZNx/0rH/TFc3dYt6ubVyS6wH4ETw7ziJ1kCFjPfeNp
	BBP2n4oWUjQtU9rgPYw77NTfa8TCf6g3ii1kSjXKfQqIlHEPMK27A6JLmpzmv+m0NiQ566
	zQaPz57laTq66JtIvbUOIdHFHl+8djg=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-M3s9VErQPcaBXOx76Me8yQ-1; Mon, 11 Nov 2024 09:33:56 -0500
X-MC-Unique: M3s9VErQPcaBXOx76Me8yQ-1
X-Mimecast-MFC-AGG-ID: M3s9VErQPcaBXOx76Me8yQ
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2fb53ef3524so24419311fa.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 06:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731335634; x=1731940434;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=imH7Wra/Q/VhKl6uoZL9x4dEWxtehMyrchME8L9ZfAE=;
        b=to60hW4+yUk2zXB373JRob93lRAPLbjJix5fzbO3RKYsLgZtGyH8JY9icjjxR/Vg2J
         HGBlzyJH8I1Mh2XN38TF5SiWQAGmun1+MgXNlXV7VrX3Y3VeD2nlXzD3Mtq6pKGXIgAa
         IJPDzxsDVGo6AI3ROuHXRQkt1mrrZSfl1ClRgyk2RrZkz3WXQjjJcGt66FdPH2OxEwHk
         pii/bnH+BQ9er2OcjMBdVCah7xiWnGQIGLRtc8devap2/HwctWLfk9hpvNNeBTSszSq2
         PVRf1RPCjpTZeRyrC1199mRrLTKVhCGniO7EhP7/v6lytkLIg3NaPek9yOf0smKp9Eaz
         9wVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPjnP+0AhXzPPkdWXDeM+RyBBPz4DhpNwde99eOQG/jlqoPAS0Uoy7SRvTLEJzHKD/baGOaHnL6vWlDUtdPNuUE6MC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/cq8fCBsDowmbGZxSfSJFzTToxWCgG5pnZi4GvrwTe6CwYVVq
	6H8mW8Q23oQNhbp4zrOuMgZyQPBgjC1Ry0jpbH+G9yWth7y1qFkE6Jw7TgF8Em5pD7nwjX8n8gB
	FC0woSLJZkFmgvEsCoregenEFJEX9u0MJPzWvXRzavhxZKmKyjXVGFqVFosieH1CBeRCJ3xV06Q
	nlEog=
X-Received: by 2002:a05:651c:248:b0:2ef:21b3:cdef with SMTP id 38308e7fff4ca-2ff20259646mr57502441fa.25.1731335634055;
        Mon, 11 Nov 2024 06:33:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuccXZO2EhpXCjarmykkNyGIHd5BslX4KPnu/ReJH9uWebmhWpOtJRtS1mC6XPv/l1aPXF7Q==
X-Received: by 2002:a05:651c:248:b0:2ef:21b3:cdef with SMTP id 38308e7fff4ca-2ff20259646mr57502281fa.25.1731335633632;
        Mon, 11 Nov 2024 06:33:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b7e87asm4953327a12.20.2024.11.11.06.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 06:33:53 -0800 (PST)
Message-ID: <5666914c-e8c2-481d-8fdf-aff82865c228@redhat.com>
Date: Mon, 11 Nov 2024 15:33:51 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Ai Chao <aichao@kylinos.cn>
Cc: Armin Wolf <W_Armin@gmx.de>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: Lenovo WMI camera driver, switching to SW_CAMERA_LENS_COVER ?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ai,

I have been looking into all the different way the kernel is
currently communicating to userspace that a camera is disabled
by some form of on/off switch / privacy control, see:

https://lore.kernel.org/linuxa-media/a644fed4-aff5-4514-8e35-d6cab642d3dd@redhat.com/

As I mention there my proposal is to standardize on
SW_CAMERA_LENS_COVER. This assumes that the button
which generates the WMI events actually enables /
disables the camera the hardware level.

The problem with the current KEY_CAMERA_ACCESS_ENABLE /
KEY_CAMERA_ACCESS_DISABLE events is that looking at the
HUTRR72 specification from which these come it talks about:
"Enables programmatic access to camera device"
which suggests that it is a request to the OS / desktop-
environment to block camera access at the software level,
rather then reporting back that a hw-level block is in place.

One problem with moving to a EV_SW like SW_CAMERA_LENS_COVER
is that that needs to report the correct value right away.

Is there a way to get the initial state of the camera through
the WMI interface so that we can report the correct as soon
as we register the input evdev device with SW_CAMERA_LENS_COVER
capability ?

Otherwise we could use the same solution which the hp-wmi driver
uses which is to delay registering the input device until
the first event (since then we do know the state), see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/hp/hp-wmi.c#n792

and the caller of camera_shutter_input_setup().

Regards,

Hans

