Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E040713AA36
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713880817; cv=none; b=FAHvA/ljGjOQ5trj4toB0YG0zqmtHco+fItdR3QL+5QWeEvqYkXzMKXhOSuwXydXBdplXyvI0cS7jNT2tAqCgUh3ddMIMFJn5cu5p+ieHPsNkzdQdLueVqlpD8INH6Ktws3MVAE9Ypa6R6WJnTnccQCN7B7rhsD2ZMjaNk+fxjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713880817; c=relaxed/simple;
	bh=whkSMbyecOtuKeOD1btFDJiXdm1WR/XqdTvffr+pY/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ts9DaVU1lNGkiGA1IyBICoZ4LxMrT8PdPXinG4O2UHIXf3q4KtDTbbxjg1z+s3SvYn39eu5U7xnkUyGaglqaKj1EYLNv9I/jwc2SpM80CmnLEmya1v6GT0eYm9f9kihN0vuwH/o464/r8HN+JcxQ1QohiBjbETNlAytH+X7CTcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SuD50mCW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SuD50mCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713880814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gAr04plxsfqfMR7Jan9ViG+aWoXel/y1Jwe5PfVL2QU=;
	b=SuD50mCW2XafSh5FHB9xQ3EWnNRucSIDJjWi7+zIU1VjmwVoTs9C9TfRJOfxg8xGRfAKGh
	CgtOY0N7FdFVJ9SQLnEZ+ruefz4zZbKZNLLQiY3NFGZZIqGwOmcd0WrE0nNSsRNydYxKv7
	Mm79+ak0S4LjWpZQ75NxVSSEfLc6yUs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-V2Nx9fLcOTGNf2M4lJTz_A-1; Tue, 23 Apr 2024 10:00:10 -0400
X-MC-Unique: V2Nx9fLcOTGNf2M4lJTz_A-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-571fee4bbcbso1616042a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 07:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713880809; x=1714485609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAr04plxsfqfMR7Jan9ViG+aWoXel/y1Jwe5PfVL2QU=;
        b=Q9/WoYG0u1Ny86PwH0moQE4Xv4dbU4bzMjHJPDJ1vp0PL0ePg0DdM5S4hJFygyH2OJ
         eA0o2M0Wi/grk+FizDgecXx5bH3mDcS9fqqz1zSzm970BFdaYph8EcMjSb7DYG2NpFHL
         nx3LsFWPToVJgpFzgbDB9J0OaxKmTZIwokm0NWqfzzf82AKLe+6grurjAg3I9ofCIYro
         NOoMo7qjeqKEDEVf1s1HeokFoalHdao1IO73HXbkJDitnJB9e6W5d6frVbfipyDuWvyg
         zrybKdMvrj5C4GH6dbgv4AAyY4JRIigdSl19kxREdn9n0Z31RBB/oAJWABBEYIEYs3z0
         Q3fA==
X-Forwarded-Encrypted: i=1; AJvYcCWCneSs6HUt5w7QEjIlMwBcw1J9f4e4NrS5m29pG+sidRvRAk+prMAJU8vyTYhrh1VRd5vsW1lvHPxxUNLSzFdP4liUUm3EUy0AFyLzT4ZtDRVKUQ==
X-Gm-Message-State: AOJu0Yy7X/DGyfNRMC+F5MffzHIAOvSp2pv1XNby9wucZPs3osnX96Nt
	XuZcjgDY6SRzAk6sEAEkGH7Id+EcB+WlsDfLtTGhlkjmmfAsVDDpupjsCqcY2Oh3QeVKlwo4ypq
	jB/qcgozqKpMsbWdDn19sHEgJRAzB666ZMae/jmAbljc8zX+2oOVXSEqCsCKvSc4QYWmd/PM=
X-Received: by 2002:a50:d6d7:0:b0:56f:e7b9:e67d with SMTP id l23-20020a50d6d7000000b0056fe7b9e67dmr11876816edj.12.1713880809456;
        Tue, 23 Apr 2024 07:00:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV/E++vCrfXwtgda+yWW2d+dHT3eIjCXiO+Ttf0/yeB9KUXHhuFX4TzsqC+7HUcEEq/XbOCg==
X-Received: by 2002:a50:d6d7:0:b0:56f:e7b9:e67d with SMTP id l23-20020a50d6d7000000b0056fe7b9e67dmr11876790edj.12.1713880809019;
        Tue, 23 Apr 2024 07:00:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 15-20020a0564021f4f00b00571d74c6074sm5113539edz.46.2024.04.23.07.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 07:00:08 -0700 (PDT)
Message-ID: <22165abe-b74c-4bbc-8a26-3abf58d9024d@redhat.com>
Date: Tue, 23 Apr 2024 16:00:07 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] platform/x86: thinkpad_acpi: Drop setting
 send_/ignore_acpi_ev defaults twice
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <20240421154520.37089-1-hdegoede@redhat.com>
 <20240421154520.37089-4-hdegoede@redhat.com>
 <4f62150d-da65-7ecf-fc5d-50afa5dfccb3@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4f62150d-da65-7ecf-fc5d-50afa5dfccb3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/22/24 10:07 AM, Ilpo Järvinen wrote:
> On Sun, 21 Apr 2024, Hans de Goede wrote:
> 
>> send_acpi_ev, ignore_acpi_ev are already initialized to true resp. false by
> 
> Wording here is odd (but I'm not native so could be I just don't 
> understand what "true resp. false" is supposed to mean/fit into the 
> general structure of this sentence). I could nonetheless guess the 
> general meaning of the sentence despite that, but you might want to 
> consider rewording it into something that is easier to understand.

Ok, I have changed this to:

"""
send_acpi_ev and ignore_acpi_ev are already initialized to true and false
respectively by hotkey_notify() before calling the various helpers. Drop
the needless re-initialization from the helpers.
"""

now.

> 
> The code change is fine,
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you.

Regards,

Hans


