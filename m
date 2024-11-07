Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D7E20FA88
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 16:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730997398; cv=none; b=TdDincnhrAyFsJYgZnLt0PwHK7YwGlCd7oqGfftQDf1F4stF4u1b0wA8bwXy9q6djiFTmG+YvP0r5FcssKFcmaVWehpx+ZcYezuKI+f7YKGDwaxIFddfkWa2QhlvLy1b2nM8CL7HrxslFGNWT5a356lDIdImu0KekzODGZ9Wayw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730997398; c=relaxed/simple;
	bh=IYzR66GtsFo8I/vZ0LiG7As1h6oOgmpSDL1msQ2UTIQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=YFRXkVaGJCRMwFwwcvPxXHlBr8+ngIT+P3RI60yM7DK3KI3eCItbNVQJDx97wtZMbaMxguey+hp+38ETyEezvWUSNwu0p/aPL98urQgXiQXy5gRWoJQAnRG5Qn/PR6pK1RQCybJlVcFY90ZHfajHXtlm9twLZ2N/e9eTGJ1f9qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KpRocPyf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KpRocPyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730997395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IYzR66GtsFo8I/vZ0LiG7As1h6oOgmpSDL1msQ2UTIQ=;
	b=KpRocPyfCm1liHVQYqpsfil/iH7mf8h7m+wNy2wPDfDLY22g/md3mQYujt3JTmh9BQoeuf
	L7EZRaqyRJJqlZS20WZ0ew3UV+fX1xrwDGvIeoUkCQlmfUrMn/tM5W4ydc2x5spWWMaxaU
	zbGA8smvOrITFScTQTpAeElShrfy+9U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-sXAHZ1guM_a5WkavPw3lpg-1; Thu, 07 Nov 2024 11:36:34 -0500
X-MC-Unique: sXAHZ1guM_a5WkavPw3lpg-1
X-Mimecast-MFC-AGG-ID: sXAHZ1guM_a5WkavPw3lpg
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a2ccb77ceso95524066b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Nov 2024 08:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730997392; x=1731602192;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IYzR66GtsFo8I/vZ0LiG7As1h6oOgmpSDL1msQ2UTIQ=;
        b=nBjwztzAOowLRJW5FSkFZTFqbAAPp8pjavwf4FDlVXBVFXvx7KbZGq00hRlagE2Z0y
         PtXzQCyLkqRhetbpTk+V293vUaJEC3rRhSaZQCHIjcAWAemEpfZjt5apRdjX2nwM7tSc
         FQMqv7n1FwCYuopnZMXCRpeETD36WZzXYs5ZbP/V0t6jGQIpxtuw50pzP+GNbb+vhfGf
         YhQm2KWkvHrtnMSf7MG9MY/CIFM1W/fY/yB0O2S40sUBY5aUgCcWi1ZlBihTqPhwWqZ9
         WhYidGSJmGksUqiV74+YMk/sU/e05RkPrzfY7FaxTcr32nBckg9igzimjcDi6AftxYy1
         MyeA==
X-Gm-Message-State: AOJu0Yz2NxzqwP3t2FAlIt7SqRR8v7X3vqwzh+BVCc8q9iZt/NsHTDKJ
	Ps+mDAbAwwdhDbsynj0AKGOoYGItNo8vLBv2v8Xncfaz0C05/2tYDb5EnMBC5q30zePNodLxQn1
	uzxLLK+bTKSgpYby33T0CntLSWAyiLYj62LEVtCEk+SJ0dXWRVf3bJBkEQUawoaVk+vWJLJeR8Y
	qEYt7zDdxGFGXY0i1fA5n59BubLotzFqGUfhe5xv7cikrhUyT/Qdt9xpA=
X-Received: by 2002:a17:907:1b92:b0:a9e:45e6:42cb with SMTP id a640c23a62f3a-a9e45e69b52mr1957060166b.18.1730997391959;
        Thu, 07 Nov 2024 08:36:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGBQhUDFGRrHyAwibL3Z9JDW3IACwFmKd8ORxLFVdhethWtmDkls9SBIyj1VNIYUtZsAAHew==
X-Received: by 2002:a17:907:1b92:b0:a9e:45e6:42cb with SMTP id a640c23a62f3a-a9e45e69b52mr1957058166b.18.1730997391528;
        Thu, 07 Nov 2024 08:36:31 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2d7absm111922766b.179.2024.11.07.08.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 08:36:30 -0800 (PST)
Message-ID: <02b4c051-ea11-4fe9-876d-070d18cd84bf@redhat.com>
Date: Thu, 7 Nov 2024 17:36:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Subject: Reducing my involvement in platform-driver-x86 maintenance
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

With all the camera hw-enablement work I'm doing I have been spending
most of my time on that and I have less and less bandwidth for pdx86
maintenance.

Ilpo has agreed to become the primary pdx86 maintainer with me moving
to more of a backup role, instead of us splitting the load 50/50.

I'm not going anywhere and I will still be around to ask questions and
I will likely also still get involved in some discussions, but I won't
be as active as before.

If you have any questions specifically for me, please send me a direct
ping at hdegoede@redhat.com *without* Cc-ing the list. Then I'll reply
on the list of course.

Everything with the list in the Cc will get filtered into a mailfolder
for pdx86, which I'm not going to be watching as actively as before.
So a direct ping should work best to get my attention.

Regards,

Hans


