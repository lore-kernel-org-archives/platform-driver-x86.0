Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CF212CDBF
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706722599; cv=none; b=Ow4S5yzzxH2YuE1VHsGSXIJAA8s4f5flHMwZ9xkIt+PQ3fOZOxBgeIkFecoMbwPONQ3hItm7cXiY1tTxxbcG9JofvPsxu1gZbb09XZ4DhsD/0LqvCviG/S2e90jyiTFFLVVTpzi9Kxfn4Pjglk8RjMjQI7Bu3q7cS0nc4orJ4Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706722599; c=relaxed/simple;
	bh=PA5ScC98dwd3WzkGjDIr2Sn4NoAS1w2C/H+ZNd2/jIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKmIs4+putHnEOwGZO+i8YmxuZ4BOWBPypAe9ZOtqjK/Qugbg6FOZ76W+zmBLnCNkLBVR8uSFiEeGMz1KdMeWcfEGH8jl6fAAyeySSRKqmhxe42SQz3gGzcLR+5NVtG3YlCNBqQ6oMfxLfEBVrBaXszAYw7OGlat0AHNIlt89Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Ky3Yj205; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Ky3Yj205"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1706722592; x=1707327392; i=w_armin@gmx.de;
	bh=PA5ScC98dwd3WzkGjDIr2Sn4NoAS1w2C/H+ZNd2/jIk=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=Ky3Yj2059xGOi7IsgJT2zpovpG4YfqAFKMtPUpOaLRiqh1F0Ay2HXU5MWT4TKj+V
	 RpdlmdjVsa6C7UjrOzp3ww+G60WaRPahhpWPdkCd9Ejc/6y64/oTkyF8FOQRB6gxo
	 i+D9MTfEzvxlAAe5iJM8y8dGVPRvEQaZWko5ub8JETzS/ngvb6+i6mCjYQcEUPdeV
	 MCzaJNJz4BR2M3JuU3LNVnJ81e6NRBrEEBo1hRzMCuAsJFeBc6ScinbG6JjzySsp5
	 O1wVr4FGP70fhIXSigt+hJJG2MMOx1E7EnUUbOC6GzhxMKfBGvcH+81qT9NoU+Uvl
	 PbHPBnK0cPOi8dunYQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([91.137.126.34]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmDIo-1qn8Jk3A6S-00iC49; Wed, 31
 Jan 2024 18:36:32 +0100
Message-ID: <ed222583-e7e0-46f7-929f-4e076f746883@gmx.de>
Date: Wed, 31 Jan 2024 18:36:32 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: Add ACPI quickstart button driver
To: Dennis Nezic <dennisn@dennisn.mooo.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20240131111641.4418-1-W_Armin@gmx.de> <ZbpqZqyIHuX0s5vz@panther>
 <4bd98f0f-831d-43e4-acfb-f8e65ca027fd@gmx.de> <ZbqAkNe3ONcteSQ9@panther>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZbqAkNe3ONcteSQ9@panther>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:EScFZooaI+8Vz43kv/dDlFJwSRMzTVMmWUU8cjdyR7RiLedCJjY
 VhvUd9bVu6u1CQ5WV9bGCykvBxG3K7UQTVfZQwocpK8FC7qfhLNEyY/aKCA2q/CBnAe+d0Y
 YbFrJnqVzjqqsOxbucwurSCoTwpmOF/bPtPjvImWYPNL4ltb6FlVtqCIWgiB7uovgM6CQmb
 lZlXtEBmV8knO7LNDjDkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:07JyHMc5QgM=;WnxR5YH20r6Idv4RfnahS2hZb6b
 i3TEr5g5Rbu52gS98pjGnu/KTAjdM+OA49DGT4b9ls3Iq4k4i0hDT6EgHpqN2Oo5q+AbrGSDP
 qdPRon7CKn8Z2vOXJv/AD+OtdS0j/VZJgkIFVFsJHiDLyEKzXP506UQUrIJA+Sd7wIO9zxnwC
 K2RFJ/gIxnCN3L+MET2j7/BZtzsA+QdR9NULD8LQ9fR4Ep8qbOUXEQqCk3H9+hwsXXb4OzjG9
 g3itlRRq3eF/wob2ixrvJN3ymwZFNNhPBoT3n4TjyNrnTE3VfS/PrO81EK7isupIqQObBjIP/
 ATXO6ojpmeRrj40cG1n4JTd+AZ6lLwPDphUTPraQp9ECWDcKv90MDcM2Even/JQGerULNiFTV
 jChKRCfTTwlahsLYbx1ocy8dnLBPpLECcVVd60yVGbr4QSDYMZ/iEO/eWhlNF4BbUcvaLBCuf
 hyg4a7JZHlyoXogjTZZXO9A1rPilWbYcoMi1QYjreGJ5PQNapa7fiYVUn/X5Nlvk7ehdP0Dpi
 mDES87NFZQGP6dj++OdaXGldoE0OW/jvjytemu3fUA/MkI0L92hcIvfemg96BTw/SCcG4OJjD
 ukVp6JYJM4EL+71d5I6/0sPxiU2byrw4IwhXt4K+mQBIVS57cnUKgTvNXXAfU0LACWrb3O0Ff
 RM7gWhEwrQdFGz5EmFNr5zml0NKTmXVYdX1DtlRQgCam5SXIkrTH53sYqP7PZgnfozxTucXzI
 rP4DoQRTNHoFQwHpgi0KAd/9Z1ZCgtBaqLTPz6SLHHvOVR+g7qngKlE7cywP+pZRsZd3GG78F
 e9kkSLt/SUPdHkQJFmhLaFbdlSdXEZ4lS9+NK+LV3C83U=

Am 31.01.24 um 18:17 schrieb Dennis Nezic:

> On 31 Jan 18:07, Armin Wolf wrote:
>> The issue is that you machine does not support runtime button events on the quickstart button,
>> only wake events.
>>
>> Can you check if you can now use the unresponsive button to wake the system?
> Nope, only the main power button can wake it from a sleep state, those
> quickstart buttons do nothing.

Can you check if this is still the case when you configure the PNP0C32 ACPI device to be able
to generate wakeup events (from S5, S4 and S3)?
Maybe you should unload the quickstart driver for this test.

If the button still does nothing, then it could be that the quickstart device is not handling
this button. Then we need some new ideas.

Armin Wolf

