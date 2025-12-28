Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD81D6195;
	Sun, 28 Dec 2025 21:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766958650; cv=none; b=rmprWdNK4EqHUWSo/TtEdiVTuB7HM65RzOocQar6Kp6+hRM7As6Du+ERQb3JrXHxsVV/2EGl06tw/zC9ae+kJmRCaA17bapQe67QBotFuOGifGQptaj3DavW5aCeWU6NFGj+ft+y97YZSluMcLY1JBccmfzJwlhSr1/XCKLnJ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766958650; c=relaxed/simple;
	bh=+LowKQzg2oMwl5FeiRZ9qc953KnycDQ1TdAgQGb3gow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AY04ysFegLrN9wbotuJGMjxum5OZmdKrI15Ou5O4V5ONiyC6NnCjqZ2SYZ//2Hl5So5GLFty7Z8c54W4GnKjnVKHhuLC70SXTTMfaexveBP+yg8Z/27z4yLk3y3kheppqz24Iua2Fts6n8RPNK2rYMoMI0AoNmsO2g0eQKW0gvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Vx/u1OnI; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Vx/u1OnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766958645; x=1767563445; i=w_armin@gmx.de;
	bh=+LowKQzg2oMwl5FeiRZ9qc953KnycDQ1TdAgQGb3gow=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Vx/u1OnINPrhKHkAYlhi8mOzLlqVKPwypev+NcoDKROqBzFFeGQLfwKyZ1cSvi0H
	 uJYoY3igLKY9lVJIoCeCTZUwWUkXKIbNNDihbfLndQ3Ski+RAwo2/aLuGT0SQjkay
	 ScF5hKd+0B1j77x+C1zGPUVJoP7+vGAeK/qQYU8g05UZ+oqzb/uO5ar2rcFWPVFZT
	 8DmHxKghUd+yPraFM8xbTm2q0AEp+Kzz7OVBvHWTZMHy6fd4kBDBkjOJMfg/7Qcc6
	 Metf9d2vYHbmMWTNxCx0JrfdP9o8/zTpJb8b0kfKBsmTFrKUn9MzGwiHM0j+hMRS+
	 vK/Kq4RllyVrSuZcVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([5.61.142.23]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIwzA-1vLChT1vpK-00Ppno; Sun, 28
 Dec 2025 22:50:45 +0100
Message-ID: <7933de4e-7775-4657-b59d-1aa6097308b8@gmx.de>
Date: Sun, 28 Dec 2025 22:50:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samsung-galaxybook writes to a int via a u8*
To: Gianni Ceccarelli <dakkar@thenautilus.net>
Cc: Joshua Grisham <josh@joshuagrisham.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251228115556.14362d66@thenautilus.net>
 <c6f87174-8ab1-40ae-bf7d-601caee89784@gmx.de>
 <20251228210649.65c1dd80@thenautilus.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251228210649.65c1dd80@thenautilus.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:gOR1GogkpAsR7ahSYlVG9eiF40Uz65e/qpzgehbF9hiBDiDmkbn
 X/RSd62GhMNlom3bqY1FW0HFtEaKtlRQ+kHjUaYXBz2H4C6KNnxgZV2+2arjCPEdo0Ae42X
 9SP68eOElokD2NZM+ZmUPVbS+OL//WsZC3XZl3vqFO/R/MwGO9iK8L7mXMp3lFbHxvrQo4u
 O5hTQ8Q74VoNHK8KcG0Bg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dG3IqyTShgE=;O8HhfJST6eGXZRfJlv5M2OLqDyx
 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
 6UzbBJ8b15Y0jbwZKiszhs4CAA=

Am 28.12.25 um 22:06 schrieb Gianni Ceccarelli:

> On 2025-12-28 Armin Wolf <W_Armin@gmx.de> wrote:
>> Thanks for your report, this pointer cast indeed seems to be the root
>> cause of the strange values returned by charge_control_end_threshold.
>> I attached a patch for you to test that implements you suggestion.
> I confirm that the patch works.
>
Thank you, i just submitted said patch for inclusion into the mainline kernel.

Thanks,
Armin Wolf

