Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E853F1D6DD4
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725350376; cv=none; b=BADnvo+G+NPIu3jmh8E33LdxgZ087VznvM5yDwDs9Wkzp0r7ypv0pcfLwtn1DJKqhgZTdc6wfCimn3mof0NS0wfZAtWLCJM5/xDu9ipJ+JezshhmInIEajXWNSIJgzI9cEOrm7fMg7GFUmI6Qehn8ityTyVX1ZtVhB/QH5sKHjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725350376; c=relaxed/simple;
	bh=jBvIZuq3xGZvgwDdnO6Gtvm37qnn9TrZ2kUbweEm+0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jOvrr5nliDFAudWNEuUXH032rTb5bKn+zLD6ng4O22E6qHMYJmU084QI5g67ECYbeO3I9mYbnPuw3ygvGX+q21QSEb3faR3iXlHSXAVoD7E5vUyQWqLQdihzrCPWAuZQHeHLGbNkO085b3VWxCpfZ7VSZGVS2cAkd/7uMi/X1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z6MBJWVR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z6MBJWVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725350373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hRoIG0TCGqG1Itvf9cxHn6HKDOm6/NT/d0f3e2vcwNM=;
	b=Z6MBJWVRz0JEErBu/+lJ9M6xhLWFbhDMxnqmAkWILkpS0ZyDaIvWuUOj0JjBWZ+C3ubLpN
	FDXuReftC1El1Uyiew20HMv8tFFB1rmhAxZa7vm7TFbZl4KBYaW4oWa3ttlWh2CiYsn243
	OtyuJdXoLr8HrXXmsEkkv0b9ph7bY2Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-ksxZf7lxPuCsO5P5wmvBUA-1; Tue, 03 Sep 2024 03:59:32 -0400
X-MC-Unique: ksxZf7lxPuCsO5P5wmvBUA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a8683751595so422860166b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Sep 2024 00:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725350371; x=1725955171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRoIG0TCGqG1Itvf9cxHn6HKDOm6/NT/d0f3e2vcwNM=;
        b=WYBjPNu0wBstii0VOFwQifRdnupjMFK1IPUIVWIJXVmwY8I+lqGodNpvCU81KjaMlL
         3GKpT0OLpWael/TfJ/TDBC4SJlPo4Qd9Gebxx8ylbgbkBWAnF6fvk/WunDcj/RbcFrUN
         T+eB34AqolBNxuWd2IUFutPpIeOWSHUZWDvpPxfMtIu7x3BMMBPYBLywrbQ3NTqMoNn0
         xSvFUkZq4PlVweMp1Cp23AePH6i5m1xf8uYQGx8LInH7Np1rJr0dGrIVCF06Xds2S8vg
         PjZWxnrJcfBWE3e2CQi5x7hJK+EB1s4KRZiCBBfXupsO66BTWX4lDcNFmU1EUvyBX4Ym
         TMOA==
X-Forwarded-Encrypted: i=1; AJvYcCWj9SI8Mi+FzdO7B3o3j3KV6kmlKJDn7Ed4AuLjW+m7mkBJZ3pQHjX04czLq6Aq4Qwbp3hgp2xkAlHLtEuVjRYxkTXv@vger.kernel.org
X-Gm-Message-State: AOJu0YyVHK5WHjJ8Blwfb5Oti761fSAP22jLw9qHU8RwuUFZyQEYWhxQ
	dQFYXVEZP96eeOidw8zPgZ2+tyZ4ZHpX400ifBWqR9BhkiH09yPq4/XUCL5IB9+tOTnq4LZOLbF
	e1ZtEi3pkJL+9TMZL3DBhUgboSBKxyOBoLCH289K5gwxlKLJVSJll7i9r4cRRmUK//3a28sY=
X-Received: by 2002:a17:907:7287:b0:a7d:2498:f927 with SMTP id a640c23a62f3a-a897fa7500emr1131944566b.44.1725350371297;
        Tue, 03 Sep 2024 00:59:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjdHzldPZjnif2/B+2p4iyMwbTmPvp3Ldw3QQZjzqCYFmufDsmpmju1XQyzbQRwCafLEM5Iw==
X-Received: by 2002:a17:907:7287:b0:a7d:2498:f927 with SMTP id a640c23a62f3a-a897fa7500emr1131942366b.44.1725350370823;
        Tue, 03 Sep 2024 00:59:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196b79sm647996566b.112.2024.09.03.00.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 00:59:30 -0700 (PDT)
Message-ID: <485b452b-360b-4464-b606-8adb8dec5c5f@redhat.com>
Date: Tue, 3 Sep 2024 09:59:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] platform/x86: thinkpad_acpi: Add Thinkpad Edge E531
 fan support
To: Matthias Fetzer <kontakt@matthias-fetzer.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <f99e558d-c62a-41eb-93b3-cf00c016d907@stanley.mountain>
 <9566460c-4d0f-4ead-9fa1-a265c936c3d9@redhat.com>
 <f6f5a75d-5014-49be-a82d-d8d4b5192e3b@matthias-fetzer.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f6f5a75d-5014-49be-a82d-d8d4b5192e3b@matthias-fetzer.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/2/24 10:26 PM, Matthias Fetzer wrote:
> Hi Hans,
> 
> Am 27.08.24 um 11:09 schrieb Hans de Goede:
>> Hi Dan,
>>
>> On 8/27/24 10:45 AM, Dan Carpenter wrote:
>>> Hello Matthias Fetzer,
>>>
>>> Commit 57d0557dfa49 ("platform/x86: thinkpad_acpi: Add Thinkpad Edge
>>> E531 fan support") from Aug 16, 2024 (linux-next), leads to the
>>> following Smatch static checker warning:
>>>
>>>     drivers/platform/x86/thinkpad_acpi.c:8387 fan_set_enable()
>>>     error: uninitialized symbol 's'.
>>>
>>> drivers/platform/x86/thinkpad_acpi.c
>>>      8319 static int fan_set_enable(void)
>>>      8320 {
>>>      8321         u8 s;
>>>      8322         int rc;
>>>      8323
>>>      8324         if (!fan_control_allowed)
>>>      8325                 return -EPERM;
>>>      8326
>>>      8327         if (mutex_lock_killable(&fan_mutex))
>>>      8328                 return -ERESTARTSYS;
>>>      8329
>>>      8330         switch (fan_control_access_mode) {
>>>      8331         case TPACPI_FAN_WR_ACPI_FANS:
>>>      8332         case TPACPI_FAN_WR_TPEC:
>>>      8333                 rc = fan_get_status(&s);
>>>      8334                 if (rc)
>>>      8335                         break;
>>>      8336
>>>      8337                 /* Don't go out of emergency fan mode */
>>>      8338                 if (s != 7) {
>>>      8339                         s &= 0x07;
>>>      8340                         s |= TP_EC_FAN_AUTO | 4; /* min fan speed 4 */
>>>      8341                 }
>>>      8342
>>>      8343                 if (!acpi_ec_write(fan_status_offset, s))
>>>      8344                         rc = -EIO;
>>>      8345                 else {
>>>      8346                         tp_features.fan_ctrl_status_undef = 0;
>>>      8347                         rc = 0;
>>>      8348                 }
>>>      8349                 break;
>>>      8350
>>>      8351         case TPACPI_FAN_WR_ACPI_SFAN:
>>>      8352                 rc = fan_get_status(&s);
>>>      8353                 if (rc)
>>>      8354                         break;
>>>      8355
>>>      8356                 s &= 0x07;
>>>      8357
>>>      8358                 /* Set fan to at least level 4 */
>>>      8359                 s |= 4;
>>>      8360
>>>      8361                 if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", s))
>>>      8362                         rc = -EIO;
>>>      8363                 else
>>>      8364                         rc = 0;
>>>      8365                 break;
>>>      8366
>>>      8367         case TPACPI_FAN_WR_ACPI_FANW:
>>>      8368                 if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8106, 0x05)) {
>>>      8369                         rc = -EIO;
>>>      8370                         break;
>>>      8371                 }
>>>      8372                 if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8100, 0x00)) {
>>>      8373                         rc = -EIO;
>>>      8374                         break;
>>>      8375                 }
>>>      8376
>>>      8377                 rc = 0;
>>>
>>> s isn't set on this path
>>>
>>>      8378                 break;
>>>      8379
>>>      8380         default:
>>>      8381                 rc = -ENXIO;
>>>      8382         }
>>>      8383
>>>      8384         mutex_unlock(&fan_mutex);
>>>      8385
>>>      8386         if (!rc)
>>> --> 8387                 vdbg_printk(TPACPI_DBG_FAN,
>>>      8388                         "fan control: set fan control register to 0x%02x\n",
>>>      8389                         s);
>>>                                   ^
>>> Here
>>>
>>>      8390         return rc;
>>>      8391 }
>>
>> Thank you for reporting this.
>>
>> Since this is just a debug print I think it is best to fix this by just
>> initializing s to 0 when it is declared and then just log 0
>> in the TPACPI_FAN_WR_ACPI_FANW case.
>>
>> Anyone got any better suggestions ?
>>
>> Regards,
>>
>> Hans
>>
>>
> 
> Since there do not seem to be any other suggestions I'll fix it that
> way.
> Shall I make a completely new patch for this since it is already on your
> review branch or would a fixed v5 be enough?

Please submit a new patch on top of platform-drivers-x86/for-next
or on top of platform-drivers-x86/review-hans addressing just this
warning.

Regards,

Hans


