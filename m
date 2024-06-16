Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3743312B93
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Jun 2024 18:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718561903; cv=none; b=U1+pPQQo22OypR8CbeCddPekZpf7SUWLb+wpDRz8uJwkHk9RZltQE34mzGw8TyGTyVOmrnA6Lk7ol8zbx7xTSSBTDH1Aor2xbg0HI0U99vS/crDDfaaLwruD9eHuJflyYz8CvbUQA2MawFlP8l4IPBpIZQ7DMrgZlpB4is+aegg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718561903; c=relaxed/simple;
	bh=r0QtSYOLvYjcaD5vrvbZHBIh867lMAClbNwR6IzyETs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IZbdFdMZFOA7YY7NcvYr4NfYPkd/RaF0tLNx+isP2IaBt1nE2ElMHhvGhJ9QRms9vspmoXJNBlrXSteLScaz1zFLrKjaV+2IOyzlus24foBh7vyhhE/fhWmUOtPiveuCMadIuXiEGcV5QwkycL3hnsUP1ARicrfj0ml5w+nv7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fg55yZ6n; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fg55yZ6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1718561898; x=1719166698; i=w_armin@gmx.de;
	bh=r0QtSYOLvYjcaD5vrvbZHBIh867lMAClbNwR6IzyETs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fg55yZ6nmNxSfdoSc4pFovomDTrYrH3Pi0GH7Pz0hUi/x+IbExtn16EW2E6CI7p+
	 XLkzGvJzS6/bKRC9k7YgpVEaEFfedyWt7wMIU5hVdgOpKIDN4LgaRSSLqOGaJV23+
	 scMLjqoXdb/MUpnrPH7AXeF0Xk85Q/BXyEWjGo2IISbk9PVIosm+HiWKIp3C/0/Vf
	 n827KNUSTpVq0E/nk4wr592DJrv93u/b1r4I6TtWG2Y5ItOB9Rw1ksdBLizR3c+aI
	 HRS3WNfrxyr1V3gGcTMOvXLionPuz33HngoMADN6eDZqcXlSLpWhGFDavIow2uYW+
	 NKuYqWUjKrO6q9crGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVeMG-1rrRPC2PfY-00OzvK; Sun, 16
 Jun 2024 20:18:18 +0200
Message-ID: <686d3c56-b95e-4081-bde2-d36a7c7ab2e9@gmx.de>
Date: Sun, 16 Jun 2024 20:18:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [sony-laptop] Hardware keys are not properly mapped on Sony VAIO
 UX VGN-UX390N
To: =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <50d7eef9-17c4-4be2-bb25-37d7b74048cc@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <50d7eef9-17c4-4be2-bb25-37d7b74048cc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:48J36MzbaGbFFDIIMNXnlhYAcJdmKZp0IUVUrOsNoiBBA+yDPif
 9Ay3dPDSG10A7Vi49PvBY+tMlWvcHsneDLbow/C69VNDufx2xuPtIchMDQ+4CIBbuqvQjUS
 S9jDA8Fs5UYOu7eAqMXle07eY8E51RLhqeSFy1PIEK1B7f8phnHtHirxZ/25sJ2pVH+KJWf
 Vv2N9JHHoY5HvuA4fMWTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X2SimG3rWIo=;qSs4xCDDnI0zcxIaNaRfqzCcsei
 jAF1XCb5IkovvDoGMABWxloUP94barBRdukreDUxY5f2hqDWWY7Y0UG6CFXdH3V48FXRRLNVO
 jw/aROfZxYRu7xK7BNunQumCwX9CWNS9krK8rJCSZ9/rGsk6KOmzb8QxabBz+GJlQQJ50Hr+9
 6UPp6lsqUaHOQPtldcPumF28CIW/LygpHPT+OszWqdFMb80bY9ROgjw3oDf86H6JtH2YraVWr
 Lloyivl3Mb6m2jDAgBOtYPTBOQJwdPY/LlYp92y/5tVdDkz5ZiKrHLlBarxbSaI+JBRZDw8nF
 pkguUCxyA3bps/wafo4K54e2YKXmaxSL1XR8HwHd50U2VVJmS8Qf+eV7zB10IKabE67iMrSyn
 GoOCpBKKp4drfipDyUaqTxCx2bUsEWMRHfkvucrG2f0wnll51HQi3+d4kSlUSE3f1hx2HZD3G
 15ZMcQdCbrgvWw98Y6wFeaqgnQWHru3s1H1bBkZf3y3vknuEmJvyZddiqP8tLyTY+xLGzk2Ov
 oX28uQP8jX4OAEUsDFl6lYj74kTCbDSjNfhEFWDpfnga/KjZ7X2L06ijJhCET4yi7MezL/0VR
 n7H1d3AQkIEQ2Yb9jkSoZiwfrpvrP2nycSTiNlBFJEji63EC0LmBESK/Z+PLLxjSbqcIYz165
 wXHJGOSjZTjmmPdKMIRPUKUGuTJXQoPQjxI1US133vrrioIEsXy3SEZmAcIBi0qMGuTyRkygi
 dgbDqWSY1xazUhmBMkaEsVZPNPr62/KIGVyH6CmECA2/+e5KKtNoEXCcWaw7Gd4Edolx4T1xY
 hMUjmeocdkbpnULxg/f2zGYMdb7HqZQVHAbE2BM5ldSYw=

Am 14.06.24 um 17:06 schrieb Micha=C5=82 Szczepaniak:

> Hello,
>
> I have Sony VAIO VGN-UX390N and it has 3 miscellaneous buttons on the
> front. Zoom in/out and third that I'm not sure what it does. Both
> third and zoom out register as XF86Launch1 and zoom in is not being
> registered. After some looking into it, using evtest /dev/input/event5
> I've established that zoom in reports as "KEY_ZOOMIN" but because the
> keycode is above 255 it doesn't register, but from documentation I've
> established that I can remap it to XF86ZoomIn via udev.
>
> That's all fine but both zoom out and the third button register as
> KEY_PROG1 and fixing that is not as simple as remapping so here I am
> asking for help with debugging that. I'll be fast to respond and
> provide everything that's needed.
>
> Thanks!
>
Hi,

can you share the output of "acpidump"? The zoom-out button should report =
KEY_ZOOMOUT, can you also share the output of dmesg
after loading the driver with the module parameter "debug=3D1" and pressin=
g the buttons?

Thanks,
Armin Wolf

