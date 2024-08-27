Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F051C4603
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724767509; cv=none; b=Jehzjt1xvTgyIYAzMSHehSasXBjoF2rzYDt21a9o4IYqhQIcfs1ShJkhoZiZyYKDZ+c+gb58xl2fEhQzFsR2hhFxAxCk3uwSX+2sDqK3Q3tpI/ARCsUOlxkOqd+ctEzu3u+GVIseUwdNxLAFH0OKJpviDlOhQe8yRVA03WfHMOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724767509; c=relaxed/simple;
	bh=bM4fxNbrY/+xVU8fyQSBkQzkgoPZsh5qN3u1v0lkPNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pz57OogHeDeV4LKUlDpODyZy4RtktV/YRFYu3kYvTfUQdXmVVWuErlNzD+9tZ8VRxRCeaWNz/z9pHgeyxLvJUHML5K+Wmtpip3ASU8hJ/v04K0pNEbU1nwqSX2+QFxtB2LtYsSk9dAkxh/X9XFBX7iD7XIXO9b2DifYZUKuvORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dVm/x56f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dVm/x56f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724767507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/+4z3eCYQ3ifiWxh2Mo64fSEyLTY0srxIMSGlgXIu0=;
	b=dVm/x56fl0aiZex/4aRKFKi2lQ+y2BouFKS8PUtgzRHc4EbYDjKGROzmeIjGyfLYYGfPbZ
	cNnrFNbDjgAw2sEqHa0St0BC4woPiPysF7es286y3XRVjBRJKhclt6coiYUdPAV5I4s0ej
	rugUCD4gGNHB8/EYPNbsA16qURsIkJk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-r_3QZ3BVPruMS7hgT1h4ww-1; Tue, 27 Aug 2024 10:05:04 -0400
X-MC-Unique: r_3QZ3BVPruMS7hgT1h4ww-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8680b74416so833590766b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 07:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767503; x=1725372303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/+4z3eCYQ3ifiWxh2Mo64fSEyLTY0srxIMSGlgXIu0=;
        b=s60rTKbfaiYWv80HtKmFLKc/16yQDPJb/ydQTBcg8FzCjAuXjbF13g2Sp0S4py+cTh
         kVXAVdPkfZmA0gzYp7ICCI3mKLlZLtXNICbRBYzdoIaEJ+Z91hhbmUjyB8SnOT82aMnK
         4EAWc5AvNaWNCcVBR8oY2uojw0uqE8s6hGLXE9E/iXMa67HlwtA9uxchqEzeTVA596Ot
         aOYDTAroRevRtvydCZ3CkTGTWIII24Aa5V4Z2qM2qSDoWqV2RD3yK8XCCBQB9AKMCORd
         lDqujXlYKet21mo4f/7BGq7QHZqLrNK3k6KAus6hdsEejfbIlxjgh2VSYBH36yLYADgZ
         ZvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJcmoLSpuGl2nh5GihPilVfJEDrC41u/8SRYiMGCWBA47enTkq0U7TDiWCig+8AIX3d2mbCMELAI/HNZn+dBC+ni9q@vger.kernel.org
X-Gm-Message-State: AOJu0YzAYLMjPflFSenOW/spjzQ0jU5KbVjg01kytbA1tk0VLNm3L4jA
	IML4FG9DiCS34PDobuSkSApuIIieqHvfFfzxBEeBQVr2BkkFNFja7aIgGE/8Y+qyp4W6RoR/dKR
	S4VO88ljBujY2xMdHNjZl/q5YqeLDz25UB6cyq4/09eLHtNKrmcOBsQShNwmqww1YEfGYlA8=
X-Received: by 2002:a17:906:fe46:b0:a7a:130e:fb6e with SMTP id a640c23a62f3a-a86e297a558mr332226866b.15.1724767501475;
        Tue, 27 Aug 2024 07:05:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPFM6fsuNqAoz9t1ZCb79CqPD0sS5dxWyKrPwS3nP6u25sZDYw8Fpsre6BrGY9O9j4ICI+Jw==
X-Received: by 2002:a17:906:fe46:b0:a7a:130e:fb6e with SMTP id a640c23a62f3a-a86e297a558mr332217866b.15.1724767500740;
        Tue, 27 Aug 2024 07:05:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e582d54dsm112656866b.129.2024.08.27.07.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 07:05:00 -0700 (PDT)
Message-ID: <56292842-2071-4c26-a380-c6ae1488361a@redhat.com>
Date: Tue, 27 Aug 2024 16:04:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] platform/surface: Add OF support
To: Konrad Dybcio <konradybcio@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20240814-topic-sam-v3-0-a84588aad233@quicinc.com>
 <20240814-topic-sam-v3-3-a84588aad233@quicinc.com>
 <ZszrjQChQ2aS5YjV@surfacebook.localdomain>
 <4dab4f36-309d-4b95-8b01-84963ca08d16@redhat.com>
 <cdd77270-3189-4fa9-9b4e-e443db5fb583@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cdd77270-3189-4fa9-9b4e-e443db5fb583@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/27/24 3:52 PM, Konrad Dybcio wrote:
> On 27.08.2024 11:07 AM, Hans de Goede wrote:
>> Hi Andy,
>>
>> Thank you for the review.
>>
>> Note this has already been merged though.
>>
>> Still there are some good suggestions here for a follow-up
>> cleanup patch.
> 
> Andy, Hans
> 
> Is it fine if I submit a fat "address review comments" patch, or should
> I split it up per issue?

I would say use your best judgement / something in the middle.

IOW start with a fat "address review comments" patch and if
specific parts turn out to be somewhat involved do 1 patch
with smaller clean-ups and split out the involved parts in
a separate patch.

Thanks & Regards,

Hans


