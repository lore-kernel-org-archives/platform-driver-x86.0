Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794821699;
	b=GhwRYaFmOFYO+OVoiDYdvz+vU1pKgmWwsa0G7JHtkbI2uvS7wFzBnUr+R4JaaOSlbXI8
	 FlRe+62FWgTbFn1byBCtdrKlyEOc+/h/gsFDIzbimgG630zdcuTPt34EovT18oUwXFems
	 i01+Ah+5xNMG5SINihWcuY213lXvuG9lmPrVQIU98JT5T5EARoaa+j/OJIJ4ywJpB0Z9E
	 VHx/qBuvLhiXg/eC/k+RAKAz6QXvUfJnYvU7y825CQgusWzH/88kjqP7Z/+bU7o+lnNzM
	 WKTlVawQfU+CGZtth2A42OyOgjobJLmgmIFYL0Van2Fi4VMtMVUnvFribZ6VT1jiFyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=sx3lep3oEjKwu+AhtV5ucJd3LnF+i4tnLcA7/aDfF8k=;
	b=zXUlhTPVH5YOEhqQGtcg8Oj/0/q3Reyeke6qxROn9QW9I1/5dV95xp9xvQGlxnbVyMbq
	 yfg5JFIeSkhjzwxAupghX3nEm8Y2zkoszLc79qtgUz09sZd5OfDwliGdAUgHV/Bt65nHq
	 ASypiJd2RLDDcXUjB90RYEjfjB2cZYJotzzzA3cFmJ8Cb/bmfyaRpa19WxXf2SA2PtAW7
	 tqDzOSSajrfT/64yWIeymlDngt3E8PyYQQNCRzk6ao//46vAdgwu7ImlPCrJh5ZClAJTQ
	 vpXuDgcGKKhPLW/zBEWVI5s7s89Vyd74pQkQrfi6s60JVbPqL1m3KtZnooIumZltH9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=II6rZYlg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DA1606A329
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 09:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3DA1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=II6rZYlg
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so31005351fa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 01:34:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794821697; cv=none;
        d=google.com; s=arc-20260327;
        b=g1f82C1tKHJl3tun79WyooS6ZruoGyIoS6kY6jSA7TXN92stqW1UGnqZsIo3pDKVrB
         AcetfnUOHCdowFZ3MgMPRmLI18j+09WfovKpZXYv5mWe76ftX8wHBu2XhdsqY97i1veY
         HTIG9KL/cXVcKxydzsvw2LxOCZtiqvz+yDxWzoXQuuPlOwbJ+RfFiFsCcKEPGAMw1w7s
         d045IurFoby5YNSybrdQqKoeAAxeijUtxnvD+Jf9r4UgyyX/LepzzZAAV89Tu8NrgLu5
         bPfHT0ilpXLWOqK8/47NUZxAiVfzXqBlov5O9vTZvuhii/1FCw1fn+NTjjSifx9vCtZa
         fF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=sx3lep3oEjKwu+AhtV5ucJd3LnF+i4tnLcA7/aDfF8k=;
        fh=bl3oaCkJqJLi1976U6daTIbmpx9cT8+79DLB542x7lw=;
        b=FG6cvAfYayTDzWkkxMTGCM2llKZxGHZuRWb+ORBbZJDifUYZNgMHeDJ95yAfJXcQGL
         F0tlP5AU3gAzF8P1DQIhKpaOyR/JubRKtCIi2W3LrduCstC6Y2vpCNVHWdEClQo9cuqh
         XGX8DzAc/iF5CqbMxpZP0esJ1zL1AMpG+RuGRjkxjFy1SqDdfqoNrX7yZAAePSogz3Yt
         npqGAokVCEkddOuzvz3t10oc8Yf2xxuICAiUL7BVdhed/DpzAG3+AzrHFtheahvgaOb7
         i6TQMb6byBDexkZcR0vmCd78JvNhdSMrQrtrYrJ2lYt0/9QDsWVhjkM9+PXONJlkysMe
         ABAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821697; x=1795426497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sx3lep3oEjKwu+AhtV5ucJd3LnF+i4tnLcA7/aDfF8k=;
        b=II6rZYlg3N0Br7/KyIHN6nlMEa9fY+RX+61YwCggN1iea4kwHRmN/v3BgefO7F8h68
         Xr9/J8xtyqF/2pSGe6HUihJeau4rSBkb/5mdZsKHkCcejeYrZ7KqJxgHhrMBd8t0hat5
         muJzdrF1KU+dNnGqX308Xa3Fck9+PjGGAdhXMZQ7lVbxVQn1mR39m34edX+2b5Z7sM0R
         avbDE/HSm1vEe9sija6CFNgbzShsn8RPAu8+FAdm68j51xR34ykRzdiuUNSvukYNwX51
         +pQ2RHL21n2LuzioFo7dabskVMQydOWhzY6yofOY2EAtm2ccFVOfZYP4BlLEWTq3zSO/
         rTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821697; x=1795426497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sx3lep3oEjKwu+AhtV5ucJd3LnF+i4tnLcA7/aDfF8k=;
        b=sV8YCW3rRucbxAVjsp0BS0POq6v/nzy8h5tbpO4CpaGiSWHqzeV8vpIzwNut5UOGjs
         U4j+v96YJ8ou8UfnlVFwW5mumNCw4vm9hk7hQHO8WTRTBEcZirewbAkzCGE6TWIfkBSN
         N/WmcNmOcCnlUwEWYzhcj1lgrGBorAvIWtUnoPdIW22WXIT0Ghwx8k4DU0K7q0ihm6xE
         +6xyjPcnNtnB87mSHgFIjYPDXu5oQ+MnNw/DeWLUKtYWKjVEjDzkEO7W7BHMpwfo1CRT
         TgEQP2GhVtGavjv2mOaazDvuW6yPX2na/3IGo2JA/QBNsRQPUPvAZCcztsHfcjJiCzzk
         LdSA==
X-Gm-Message-State: APuU4Z8XT3zSpwyMfqJEr2wrCnyIbk317jllYX40ihVZ1TgnAabVLAeq
	znY2cnzt6yGaWaEIApDTZo3RVjZFZgitjESCZHvRIc7UZFUZIX168L5aMCc6ph4X75/qldWUyqq
	E+EIBdnzfJrpx7uVgduUWWOdWLyzffrXEwGqI
X-Gm-Gg: AYBFou0DavqGdprovlPnAVeoEJLr7eHJhjn/vedchg8bVUPRBfzEQ1Lpi4qj7gHTHVL
	9UTpSQzHpVke3iFSaQ3TlLWrAcYpydsGLapizK6qbcuwJxit6o6eWX8goNndnxfNSgxvifvFsiO
	61DJV2ljdyMnRAVrC5V2rTqiTtqzuNje+zPuFmAbG8K4mWVHF/zCxQCZWaBWe5En5u14fv1BYlD
	VfcwPZsVxuAM+5tMZDEXA+k4/NBVdmVehqM7Q5HsFUDlTaqPJL9Vjy9818J0r2Rs2EnIB42POyc
	kst/vixhkKhJJ8eAcnrBGomBcVp6+NHdSD1aWFa0VvTpEjOcWTuMvRZUhrsAyTr/4u9x18yHHJX
	ThxmKjGYMLxbKfQ4rmTYKwPWlvoWl6zhYlbzFImwQB8iXwPAdDDBHNDg5UaYzIYi2rbeC8Sufsx
	aPw36pNe4ktq6LhUAdzIQLtmkeecsKGWPjiaLKe9jy5mw/bFL9y6CERh7LHNOsfRHud56QVKUnB
	nwU4DDhJKw/XLhzakq3rDRw0fGGRDS1jjJ+gtzaNOnKC7vjtEjftSUJlcVAhBV2ci1YNZ/97cmV
	0RnGE+F57yWh7aP+JrJZz8xF0EhIJd1e53CiXfrDmmYRiiczvI24dBb/5E5fJKyE2lTxg5bmxRX
	F/0WiE5ZW60jttEt/
X-Received: by 2002:a2e:bea4:0:b0:3a9:a8bc:e0f9 with SMTP id
 38308e7fff4ca-3ae2b52951cmr27091121fa.7.1794821696835; Mon, 16 Nov 2026
 01:34:56 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?Q?Adrien_Verg=C3=A9?= <adrienverge@gmail.com>
Date: Mon, 16 Nov 2026 10:34:45 +0100
X-Gm-Features: AclHuK9d_UDixLwD_bUiTx_leWg907hTWUGDeufcwK55QjimqEOEUAVWTV2fbvE
Message-ID: <CANsc=4Uec03px3_Q+4YQDwL9H5FugS_QyEGPKAOy0Nq5tTOmPg@mail.gmail.com>
Subject: [BUG] platform/x86: lg-laptop: Windows key not working since native
 ACPI events
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

It looks like commit ad873d634095 ("platform/x86: lg-laptop: Add support fo=
r
native ACPI events") broke the Windows key (meta / super key) on multiple L=
G
Gram laptops:
- Pressing the Windows key doesn't trigger any action, e.g. showing all
  activities under Gnome shell or opening the Application Launcher under KD=
E.
- Randomly, pressing the Windows key multiple times in a row (between 5 to =
20
  times) does trigger the associated action.
- Pressing the Windows key in a combination (e.g. Windows + L) does work.
- Soft-swapping this key with another (e.g. =C2=AB Alt swapped with Win =C2=
=BB in Gnome
  Tweaks) allows bypassing the problem (e.g. pressing Alt key shows all
  activities, like the Win key should).
- All other keys seem to work fine.

Impacted hardware at least include LG Gram 15 and 17 (see
https://github.com/CachyOS/distribution/issues/619):
- LG Gram 15Z95U
- LG Gram 17Z90TL

I bisected the bug to commit ad873d634095 ("platform/x86: lg-laptop: Add su=
pport
for native ACPI events"), which appeared between Linux 7.2 and 7.3.
Additionally, reverting this commit on the 7.3 branch (along with commits
 543efc52befa and 9f5724492217 that depend on it) fixes the problem.

My knowledge in ACPI is very limited, and reading the commit, I don't know =
what
should be fixed. However, I'd be happy to help and test patches if needed.

Thank you for your consideration!

Adrien Verg=C3=A9
