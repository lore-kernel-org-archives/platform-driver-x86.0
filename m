Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4143A1DB
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Aug 2024 22:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724540196; cv=none; b=VASWnSKqyIvVW6LfEgMHfGpjTTTuuawuZrJI/m5MDDBfSzK4foNuGASc92n6VHYllxqBpMJ6aPl2fed9dpRaaHsegRp/F7K+5vruI1j7sDEkxx/ovPksPfx5rW+dHq0z12GhzoTNEWEDL+aDaS1TSZEfHCl4l9NYpArtAcfurhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724540196; c=relaxed/simple;
	bh=miiRe9wFgKh59LbXGMnReb0KO8SHoTlBGR+/remUhss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOvSFOy8XFYQSdokh/NKn1Gg1chb0Z01LBxuJy1Z+eHuYXMKPvIXO6CcHZdMutvINi+1D2ZoeqkJJ0qcaCnzDJSLOggjXqGbrFW1x4FrpAPGf0ertDoTCLiKLIWepC5HoUPrAalBcB5vpHeSNJ31s3GQTxz/fpVt/PIlH0S24q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=jehoMNo2; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="jehoMNo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1724540190; x=1725144990; i=w_armin@gmx.de;
	bh=miiRe9wFgKh59LbXGMnReb0KO8SHoTlBGR+/remUhss=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=jehoMNo2/rNL7WnZ2+Bps7GosWIKlm1uTTwkIyL+lcK+ZywUsrQnS5L7Ofhm1AWJ
	 CYLMhx6D3mUhClXEuJk+Qn79Kh6EWSj9gGiTzYHaBDGF2+n1tDCPV/SVDYgQnSd5P
	 VLmF26jUJnHdqRH1GsBTqdaQSxuAjZfqPlLdZRoKj/HlPkPj25P/TJm7mg07YJX6M
	 b/nrU5WjJQCQGLjcRppzlcJPO1uPxhC5JjgGGc0/azgG9tz2j0XZym2uJSr5oXGvl
	 FK/3gKx72suMI+uF788OTZ1VyTv7TNd6YdZBZi9qy03HCa7SmYHO1H7HlixKAz8MK
	 /Jz5Doia4MOExILxTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZkpR-1seKXR3LgF-00UhyO; Sun, 25
 Aug 2024 00:56:30 +0200
Message-ID: <ecba8732-fbef-4e4c-b518-d5042fd18480@gmx.de>
Date: Sun, 25 Aug 2024 00:56:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Add Support for the Acer Predator Triton PT14-51
To: Rayan Margham <rayanmargham4@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <808c835b-3500-4345-a338-b0f8014d049d@gmx.de>
 <202FA1F1-967D-4D99-94A1-9649C7C9B6F6@gmail.com>
 <CACzB==6Hpp173CzcsOpU+epz13uDU5mpudX1xvZuMkphODTPAw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CACzB==6Hpp173CzcsOpU+epz13uDU5mpudX1xvZuMkphODTPAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Gq0uA8FPvZMVUFhm3kCYO5iCdxaMH3Xpdjw5d7dqxJDXJ1svOb1
 0I0ez0KwgDzq+kyH5WzpwJPfszgN/QyLGnYlmVNdqTsINBvHbtx9gxgnziSniOvye6CULaO
 jRItUTAX97gTcliFW0vYpZA8CpXQZcxOrl8qusWzN8aasDGai6hkl0bBX7R1Ghw6dkLkBUv
 +WTNtjP0T77SfNRx6VULQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jIAcdxnAt20=;qYiFen59zQ7+YnO1I+jUEO5ECwb
 j7SnoCvoBBw9owCtbR9r/NDvm9gwa6oaqT3IE/VDsVZtxZRNu+NljsOswwT7dwG4atT1CFqkb
 cPfLDSU1Vp4sa3T/S/2y/uXX3uNkWZ8ssYw4w0Gv1NgkE+uiR1mGSDkYSyjW7YoPfHNWYXrya
 +4R8e9usHUkKsybsGRySAuPPqHLR9e02Ryiyx2ojhNmQ4B+A7czuTQKgQrj6eNsPm9572CcDo
 jNXoCtS2EvJ3MGUpuXmGP+T0pPhhaN8Xie6Mctbh5XQxIzk7S8wl8mYZCLKTkkNURXC3giUCj
 u+V+wnpVWAiBfIJtr21fXd7PMaLy/tdeI1P3tpWQjCy8PHOJHE4w+NyjUG64P8qmotErU3VCv
 VWL0/s9kDMBnZq4bctYtT/SuKeCQkONvcY7y3wyUnNdW1soacNXLlymwsTZxPToAQOXLLEI4J
 yrtX4N3/mqLgUoThOE3s00HGZY6RHEXkw0j7s8X+fXIiDLMulRwfVCNsdA7A5bIIFKq1ELCfe
 XiKmIe8oI59IW19zloSw+s2y+qguQX1xLmJgcZBaJNWMaRuyFzLj3TFIjpMeyTeWgQEGME1aD
 2O8uttgqwxAO56PUv4DTtwVM1nYh55b/PpAovbYT2ErUUa5+FPht1R/C61dbJuA1yfw7+nIvF
 ZlIJFfHWm1oc8gUHy5CoOgYNxEHyl+vz3fWWY6lQGvug3xH/+vevJmjxvKHoi2WEZCXdM8x0H
 baW6i2BKZvkoL//gwLSzxxSXhRTr8R7G4DajHvxg+Kj1FASulQUOP3C9u1xTT1un7gfOyAHUX
 zLs6F5FDLFyenwdHIO/6w7AA==

Am 21.08.24 um 13:41 schrieb Rayan Margham:

> It does not work very well, sure the mode switching led changes but
> the actual fan speed doesn't change. Performance is still awful, and
> theres no rgb control for the keyboard/logo
>
> Rayan Margham
>
If the fan speed reporting and the power profile support works, then this would
be a good starting point.

Does the fan speed reporting work?

Thanks,
Armin Wolf

