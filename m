Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EB3647;
	Thu, 26 Dec 2024 00:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735172343; cv=none; b=t+p2rQozd10rdm5hkszvErxr6czvywwCX7Jqmj6QB6xGMiT1b5/v6p3NV2dM9C8fQDMLK3KFyrECjth2pySveBG7vRns9zMLv2w7t8B5tbXu4iQ3vTdCLvSbv2JxiixmzrQ0/v1/EFBJXXVzJE69dkI+3eSJTbmxfmzPH7ncTEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735172343; c=relaxed/simple;
	bh=wrpPf3bCywbP7wHmQa/D8MVFTbyo3nnMovkdVcF8UG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NiyvAWow7fb2YS3kGhzcXVXSfYJzj9uao2WoSNeW4juSugi9yBzCICuOgNH88N9mnba2t05hFbmYVVk9tSS6Q0uAer88eFfxZiLfP0Tj7nJeKDIb52U7hoy0/Oy7RCgoVUzhz1W2JP1t57S6rT4WMJW0xb2hKA62pt6S9bvh9cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/gXSNsO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/gXSNsO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43618283dedso60434385e9.3;
        Wed, 25 Dec 2024 16:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735172338; x=1735777138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUjjuepKmPmIMKznWdUtptGkJVmslB1gLiRMS6dORq8=;
        b=F/gXSNsO1M/dyNtSlP/wkM6VHLyqZI2zppZSEwNymaWEqP1pbqhyKgKFz4jbo2Q6mQ
         V/AM0rQLO6vtKZES9MJjUdf6YmM3ANtyp0pps2FkkRj74h0EbQNso2pcnLjhXha4EBnd
         epqJpZlNDXhA6OXzxdjOdSjYjl4gZwkWNrZeI59WB7SAKinjs+HoWNxSi0eriaUaTT0I
         pc+I55aH+qG3Q7dTlK5uYi4pPts2tfOXf0g6g5TZ2hPP9BPEtBUwg5Mi0qfwcadsRpit
         W+fn0ENJZlZmh2dg8xwQNe/iV8cDw2ZvTJkmijjLOOtO3W57X+wNSOCn6FAuHDB63MIB
         n2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735172338; x=1735777138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUjjuepKmPmIMKznWdUtptGkJVmslB1gLiRMS6dORq8=;
        b=m4pKe8aiZsCdoGUzRzrMIDZT9oE8tQfJakAwjzaxFpJ/+YVjDzXJuVdyqXeX6wPtM0
         dG98gt9Fkb/39q9i5lW2fJOJaK/Y9UApJmZBH1u0SWLoJKwCbWoGcWnFMpTiMqRUZB+o
         ZyPLSVqMA+Oz4GYKQhkf8ZNh3OrLoD0xLqeC34Ir/Quew8mJeC8r+qtEkHrhCgnZIYwa
         YqRwwL92g4xybUPT80tXChA+zD5Ch8a6KnN8rjLeX6GqNDFEfc90vCqdCWCLrPbnq9c8
         qCv12MT8yI2w95POXsVMDT8jro5e9AfyVTviOjY3GKE/bumi7DmH3sT3NK7kptyJJB8n
         dOWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwD+HIqBEDpIBusPpoNAqwftysX7S7ql/8c7OSypyN4vxEHxEKncAa+GTxcbDmkXEoRzVNtrgIyI8SlIBR95Mj8W416Q==@vger.kernel.org, AJvYcCV/iP/cAePSV1GuyLfHEPfa7zqAkIV70f6xq7GO48tdrUarnq2vkR0Ga+ky6dGsHk4aetS4A0aL7W0=@vger.kernel.org, AJvYcCXidc5MX8Ii886xohW/oGOhJG8OKTMQBIkc6AQZU4g1hNoWRsTAanQtovl+wtTyU9jyxWq1zmDmISFizI+g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0YjMs8+isrGw0qXUh1FttikbNAkf5SIDARj548E4c+l50oWzi
	crZgra8LYL/t+NSzgutyqb7iZyeLGCcqg+xTHb/WcJ3kAs6EMlf7
X-Gm-Gg: ASbGnctrvSKCzdrKj+2gM5SkhibhWh2oOjajVcVUvA//rp2cd/RxmBZ76uSonqKM1hE
	RGVNG/vzcYDP6WIKlkwhXxlh5v+iod8D+4tCaOmFveSXYj4MpFOxAeNbYtEdaU7J5GCoHXudtva
	MxDzQDwPUmilKrdSJfn5/3ewa5S0xTFimqujLzZTNSrXCc55ja+ESd9VMK8NP5d8nJzCwhm3f7w
	jKemSGGzDSeEbWjm3Ae0naQ6FmtMtFDpPytN7AYeHHLJJ7+ZhdeJRp5Yz8kbEIKuseehw==
X-Google-Smtp-Source: AGHT+IGd0DkCRMXmfifwRyIZLezPmBrD+B/CQjbNHqoeF3n6SCj340TRczZFiYhBpCVvgaOKRB/t+w==
X-Received: by 2002:a05:600c:4f03:b0:435:1a2:2633 with SMTP id 5b1f17b1804b1-43668645cf5mr194988895e9.15.1735172338370;
        Wed, 25 Dec 2024 16:18:58 -0800 (PST)
Received: from vinyl-Legion-5-15ACH6H.fritz.box ([2a09:bac5:2a1f:3eb::64:94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e3d9sm17770484f8f.67.2024.12.25.16.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 16:18:56 -0800 (PST)
From: John Martens <johnfanv2@gmail.com>
To: w_armin@gmx.de
Cc: corbet@lwn.net,
	derekjohn.clark@gmail.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	johnfanv2@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	mpearson-lenovo@squebb.ca,
	nijs1@lenovo.com,
	pgriffais@valvesoftware.com,
	platform-driver-x86@vger.kernel.org,
	shaohz1@lenovo.com,
	superm1@kernel.org
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
Date: Thu, 26 Dec 2024 01:18:28 +0100
Message-Id: <20241226001828.423658-1-johnfanv2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a1c25bd8-907f-4b2a-a505-15785eb4b17b@gmx.de>
References: <a1c25bd8-907f-4b2a-a505-15785eb4b17b@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


I guess the most important task is to get following points right because
they are hard to fix later.

1. Should there be a unifrom sysfs interface for different access methods?
Depending on the model different methods must be used to control the 
same feature, e.g. the powermode, fan table, dust-cleaning-mode. 
The access methods could be a different WMI method (newer model), 
direct ACPI without WMI, or port mapped IO (outb/inb). I suggest that 
regardless of the access methods it should be produce the same sysfs entry. 

Example: there is a fan-fullspeed-methods/dustcleaning-mode that 
sets the fans to the maximal possible speed. I suggest that regardless of 
the used access method there should be the one file:

/sys/class/firmware-attributes/*/attributes/fanfullspeed/current_value

Alternatively, one could use the less elegant approach:

/sys/class/firmware-attributes/*/attributes/wmi-other-fanfullspeed/current_value
/sys/class/firmware-attributes/*/attributes/wmi-gamezone-fanfullspeed/current_value
/sys/class/firmware-attributes/*/attributes/acpi1-fanfullspeed/current_value

2. Naming and file structure: As mentioned above, there different methods - 
including non-WMI methods - are used. Hence, it might not be optimal name
the driver "legion-wmi". One idea would be to name the folder/driver "legion"
and then seperate into multiple files by access methods (WMI by GUID, ACPI, 
port mapped IO). 

3. Driver Structure, selection of access method and probing: The right access
method (WMI, ACPI, ...) has to be chosen for each model. Some of them can
be automatically probed, some of them have to be hard coded (c.f. also Window
tools) by the letter-only prefix of the BIOS version. 

Depending on the driver structure there are multiple ideas how to manage this i
nformation:

a: global-access-into-driver-decide-by-enum: initially the driver can store
the method of access (WMI, ACPI, ...) for e.g. modifying fanfullspeed as
an enum/bitfield/... globally. The value can be decided on by probing and
some hard coded rules. There is one "glovbal" c-file that acts as an 
entrypoint into the driver and adds all the show/store functions. When the 
show-function is called it is decided e.g. by a switch statement which 
function in one of the different files (WMI, ACPI, ...) is called. 
The upside of this method is that if there are not warnings in the code, 
then every case is totally covered. The downside is a lot of boilerplate 
code.

b: global-access-into-driver-decide-by-function-pointer: Same as above
in case a, but direclty use function pointers instead of enum/bits. There
is one function pointers for each attribute in a "global" struct. When
the driver is loaded initially, it sets each function pointers to modify 
an attribute the right function for the model. The upside is 
less boilerplate. The downside is that it might get a little
less safe working with the function pointers.

c: independent-access-in-independent-driver-parts: the driver is split
into totally independent parts for each method (WMI, ACPI, ...) and GUID.
Each driver part is responsible for creating the sysfs entries. To
prevent conflicts each part has to use a unique name (see 1)
for the attribute. Alternatively, the choice of access has to be propagated 
down to each part to prevent creating the same sysfs attribute multiple
times. The upside is the elegance and easy extension. The downside
is the weird sysfs user-interface and the weird coupling between
the different driver parts.

d: totally independent drivers: make a totally independent driver
(module) for each access method.


Some more remarks: 
- I would never make one attribute depend on another
attribute, e.g. when changing some power parameters of GPU/CPU it 
should not change the power mode (e.g. going to custom mode). Initially,
I did the same but it turned out to be not a good idea. However,
if one changes some power settings and is not custom-powermode some
sometimes some weird things happen. Sometimes also all changes are 
ignored by the firmware as seen in the ACPI dissassembly. I guess
it is best to just manage this in user space.
- When trying to find out what access method to choose one cannot rely
on the ACPI/WMI interface. From disassembling the ACPI, one can see
that sometimes/often even if the function is not implemented it
will return without error. Moreover, there are some WMI methods
with name "*IsSupported" (or similar) but they often do not tell
the truth.
- Using just one WMI interface is simple — my grandmother could do it. 
However, when juggling and organizing the various access methods, your 
guidance is needed to set the driver on the right path from the beginning.
So I defenitely, appreciate your input on the different options.
