Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554040;
	b=lnlyhSRNEYSTPd/GwyHV9Q8qYJm/E2E3LFufVGpRvlLuZ2aZlleR+pGCsmS1Oz5e76pL
	 w7JxyqlZu4HvtGz6gtS7/3Fyf4SXoADZfSBAxy8rBXkzPghWSSZG4a+gaB08R08JMXfGd
	 aG43BDIQ8molgSaQPvHIUULafVXj0s4DE4oVATJmvESLhLK0qGEv/kzs9Dy/UCOYA8xld
	 PRRCvDD8/L2bI30R1Lsm4d4dnFTFVreHqYhGLsndLlt/HsflB7huOGCiqTwvdT4SOle7m
	 llNtZoZ418/TuES7ntOdbyz/FB14t57CGtHNozhZ+MTsmHAHcVSlQtcrG+YWQX7I6lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554040;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=LMAud8XZSUdzHFZnHgbFxGwmdzpIOrGdWcgftLpIH0s=;
	b=XMdwanFjToOHGmT/5K+vSfDrkQK9SdpCGrg8QG9NgoOoeyiLDnBO/MdVHp1XIA2Zw1wq
	 UOUlVkQnA+afvlBLQqadOxspcLEZanLN1iCXQEmm8wwFK3JGqCKMCbU1H4Uzsa+m1UPYO
	 /+HNey7WME4clthArFGymQGesWzkut5T/E5TWipO4xcpnJcLX2+hPRiEPTjCghPnZ9sEQ
	 JlE2cfbarHjzSOKdvOxJaXqXywU5N2LwdICXkilxSirzad32GB4TUuSCYciMKyzbMkHiV
	 jgWizwu45YJp8ziYiAL+AvGLy9LGxohDdaGKKnbqaE7Hnd/O20sxPc/PppaCFYPz6/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=acqCV3Fc;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1AB606A332
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 21:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F1AB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=acqCV3Fc
DKIM2-Signature:  i=1; m=1; t=1795554037;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:gUzOBw2dPQMvUQv4fqF0K+5Hq0+V
   hLojMiIyunM40eyP9S2pSqk+Xk3yNH8AzAcv01gHgwOvxqTJ6O/VWnVGoh5lqpbRnLTdWp0urCK
   oEexjXVURKy7hObSUCztcQGTLGwDRceHgaZgUodG76DBNSzmkTOGgvxye8dBjTI2cxhaoMwlJL5
   lNyGHLWvCjDaojMbUyE2E2JXdWBuNpL4hEsKVEfUA1Nla0GI1PrfJa8hqP72VUW0X4iGGQNide4
   mAQFaMbJM1gv8rqj3RvnN4xtDKQgIX+xqCvNq27d/nQ+tw9t9xIkepLd0ghFDSPEbeXJVKGEMTH
   mr9N3fc6EVqadA==;
Message-Instance:  m=1;
 h=sha256:
   iapUrpJ4QVSTI4bdPDvJNnihHdlJLUD9a8qo/9tZKyc=:
   LMAud8XZSUdzHFZnHgbFxGwmdzpIOrGdWcgftLpIH0s=,
  sha512:
   prIfZSaanGni2bRmp5gXk749Mh1TLu5EVmWHA0+tq52cboYy/BhnWPGCzrwE/gnrOUkt+K3IjtGnw1hglyoaYw==:
   dcRpTA/lQLCVt9zzTAfaBemA4h+Ra6fYgqoLQFhzINyM5laZjHbZ+boPMQWWDGkZALTYhsZuoaKQmrpVBu2zsg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795553995; x=1796158795; i=w_armin@gmx.de;
	bh=LMAud8XZSUdzHFZnHgbFxGwmdzpIOrGdWcgftLpIH0s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=acqCV3FcVRF4+2OmVgSzEP4mXxt+NU8Tjs6xEupvpWN+mxtj09iDH+Xqs/NHv94z
	 ZgRpz69TnAdhAfKSCyvwVSOc4rlJ427TFfQpQENZ6XE4rBXIts/JSgDgrJlxPx+vN
	 VQ6dx8WBqMUSGMr4FBf+TEvd4Ec7uy6n2A5NKoWUMmMnKO0cvwxrqH1Ot8gTEXuHk
	 5eHnA1niA85+YbViEJTFp5V7NY+x4i2gbnXDxoF2ttzLmJ2MxhJfgbpsVjsycz6mP
	 vgTHcHRYW4BOhkZZqYeYF1phk0hGHK7vELFc8Z/jkUECOtUOtAVKo2XwNbzS+AczG
	 AaYBwpQ1amJYbOrj3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KPq-1yVrZp01WU-016HnD; Tue, 24
 Nov 2026 21:59:55 +0100
Message-ID: <a6458b0a-125b-4df7-b41e-a4975fe8905c@gmx.de>
Date: Tue, 24 Nov 2026 21:59:50 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] platform: dell: smbios: Add quirk for non-functional
 calling interface
To: Brian Mak <bmak@nvidia.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>,
 Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Lyndon Sanche <lsanche@lyndeno.ca>,
 Prasanth Ksr <prasanth.ksr@dell.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-7-bmak@nvidia.com>
 <f3dc7e25-9c22-4b1d-9555-e83db82d05a1@gmx.de>
 <792a7fdd-b2a0-4a2d-88b3-7aecf1af3d7c@nvidia.com>
 <12ff3c7e-0425-42ea-9994-69f9d56a4591@gmx.de>
 <a851c757-3110-4ecc-b920-a98736b190b5@gmx.de>
 <f95b8efb-1719-4b39-9c23-5313903d1d4e@nvidia.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <f95b8efb-1719-4b39-9c23-5313903d1d4e@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:I3DEGu+2sQfAqujeolzd7dLRhOdRid8YgUVD4stIzXsA+yn+EUH
 N74XCgnhCD1Z9mc239WGqFmDRdzSYeyjlGhJFIWth9oVPed14F7yNRVsoQ7s1q1AcJwBlD3
 wg5PG8JT/MpR5BCh9PQViLA9ocSzQIJGvyHci98I6brMleQrAsaApqYhBlVIUe8wkoAi8Fs
 tc4gawlFUyOfYlf0oB6aQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LvII02pdG1Q=;Yj8r05NMOSuvPA2zUScFRw/My/z
 klIkqv8jek2x7P+CylGY4z7vNDVDqRAtI3jCKzS3dTBpo5WxLOftx5H1x/Ot6y8CCNCYHeu8r
 XvM8KcJxuG+REEVgjImPltgIaoINtvxzM9PU3td42QrJFbuXb34UpZmx6Hv9b1kJnJZ1/SKDD
 puB2qy8Yo2x1+hS3SjqQUXhHcZfrIJ2iw5eoRk0fF+aV0YNwBrVpZ5ojWEXMXgR3pG4XIFpLh
 lOusEGLK0ZdsPif11fBbILkQ/LMjV2XNPOCs8LQjH3kYFLVM7etjqO433QtvlkIofC3ujTEGm
 muEdMFnxNsWYOg1sc7HVbZ2z4zyeJ9N4EVT11hK2w3dywrPIP7HJeSc6kcHwBOAmC9xDji8X3
 IPtIdHQU/fpCAE2sQ0g/aA5Be6U5tFjbCsRdRDphg3CE/Gj+aRQoK4BnxUeFo5y3SJwu8MB4X
 lK5MTqep89A1G3ASVMVtuOcRhOBCYjzbZrg7m9Sku/UoX9RWK+C7moB020PSZzD5Sjh4F9g7T
 lLZUS3qjTIsEyjBeFjLZWYutGn+6g0usMbhEi+JJmhgRqTMBTAZLrtajPgb88dK6lOeX/cfTA
 JceSZdLWLGRNG1dmTvgX381Bf/1Xqgv49ICmfPjEAqIDpUu1dGp8WMqHIKaLszvjslD+k4JNy
 OsPIRfRFoJW2yOMGeE8lqlsVkEs1IqMdjZzqqvVp6v1n4LhxFeo6AJtza5nsr2NDZhrgcAiSU
 vmaZuJXUf+GmD6xCJhszh4CS9OP4GztIjxDtd+4BMCOF/tnQ7+Z2LgmiKETgtaISUMHQJXG1U
 top/krww/VnaUtHOww7xCZgRvFGi6ejaSh6zH/x93c2ptRD/9AZatl6AOFlcNCXZNhGirEYm7
 XGVqafA/uppzMLC2k4q6mXFl1OXxODnlq3grIz+JaETHgPX2f3j3vt+mqxTtPddvvARkIyYeb
 mfzE2EI2EuLv3omfkb+HU+q9xQkOq8IrSLMPCATJxW7V9OqOzkmRMgNm+e34ec7yuscAGK5eA
 sYh+Ecthzh6s5p77mW9h4zUiRvUKeLY9HJ/eObQAA+eufnBhaFHnH7fdGg6Ue8gx9esiDxRRQ
 W0UWj19KJEb/GVdOHXGgL3YCMHsdNMTlR4UwjbELN6GtxfX/bsmSfgIPIeN6Z33OedOYoStW1
 8ER1XDcLqYVnjjycdhfctsrYYkECBo5f76RkUVlp3A6v14zbyZ2Ymh5KzqjyXELo/TWAaELSa
 6QMq5B9/siN4pKkqVCPWOTLgAYwIcvKGugxsMxtTJfR+ZMM0Sp4xXSV08yF66KbpYlH3Cywbn
 QhY2goEff/9PpnQjbjuGAfWVeo9lnIv4zbFRPNuzIDE2lbeIpInPSrOyHjeMXbOTXeoqKw9BK
 Z7VabSjA/C7NN0Ez1ZlzVdW37LLbHdWxOYALHqqRQi4/0B8LxIb4JDilKCIbLGTuFl2QwKr3e
 oeb4xLrf9E4t6Fw1pUlChEhrY0mriZLKq2PITebdPKCkPgcc00Zm7lfSph6HaK4TZQLCN+hpN
 FQfp91+FC+vwdV5jnlRQwGp/Tt6ZgqFUJJC/zSq6Mg3q1aEC1cfLsNpzTSO9qwe6kBQPjUXla
 lUE/RFpLMcnTruyx5Pj8q/jVOJtXxodPot1Jr99P82U7+uInP0iOuVHcpb6yUPLUa+28EDGUb
 jZfUQpmd8SVJRq8ih0oSJBnRYq2fg1RMGxFWlm5WfALtaAR+pmrt+TmMp7WMTtyaseU9/J7LL
 BeNUSoLHknPg5oUaGI9LD2m/w4UIkT3hVl0QvcFCrBUNGRFdySckbEy4u8CIN8bJb9p3/I8P1
 jccRfPwyZeEudnCE+O4upOCXDcYbTygKE09dNqbbjKlCrVjnmaFh2nLVsWjiWgfCzTuki9PD0
 NoEYspHLpgQ8w/kH+18TXHXG8TI45Nren1gdLqF03SIpvRQiz5NVkIWwJo2wN9H4XwgRqGdPC
 Bh6zmEP6BQ138btilyagM79LVjHjLiVqFMMHv/oHHx4AQxYQ7iER+GWQa8HsaIfvZwZSTGdvv
 oftFFiBVdVTL+RsIRL3Z9tL0WzRXWQoAjHryA60DV9xLFKnlJZA7NNnEiva1uRPxH54WKkvF4
 eFiRJS9a1BiwucNGcI8lvMgJ0quMNzJ+mztclE77j8RAgpRNff317TffbAURVQD+ynGgBGFlC
 mu52wdhr4smMLhIOPFHlrxHE16CvE6fMcw6XZG6W2ig+6WTkCQ8A8XbsTzlmtsFP04HINfLx4
 nSJdk1oRlpBwJFKcI2Ijf6eAC5BS+wJInbK7mkt05ceLhbgL4R8vUq6yopwxtqAJzP+g6+GVb
 hdHAjkZ6LR/vUmY4eiXWT9KzJTSAMrzO/vNfafHJDkL3tYPy3GWbcUugPVIgafLjFeZC5F9p0
 EWHeNrjZC5zEi8OXYK3eUj2sXu8noEdaKsejHclqya1V/jrw90UVENiCWXWG83miVAWPFhC30
 uqiI1Z0uqik5sFbAbMskLSmMFPLYpcuiyFPtIgDVgm8SvR709aDl5mlC9GPiXHQACCK6hqK0V
 xSR3RUDfm9N6/BhwWFl0Viey7ockXX78FqKkN4hGM3msnapUcgpt+LQUBIRHy2GQmQztzm9mm
 x0Xq3CyNKby4f0tZIusFs+5Jbw097TbafSQZxzW/GcnZQQPnN+CEWolcobF7apTDyGPXfzHpU
 pm6wrH5S70zxd1OojTZXPoDCpqyClIeOZOuqP4QeO2L2sFEGqHLVEGh3AEAMchoWDYoXxKu+6
 7HKavy9NEs7xm7ZuxLCK4UN63XX2PKPR7E8k+h3+DzHAGx7JJEz1UWDa4rLvJqi0dTGKZGPQt
 vL3KzPr1rw5HDMiEW+OKwxz9R3tmPMT/e3qO7hJYVlrkVY9g3VRsuIF5Nb7zn5/KtcgRnxzqJ
 hQ3qrRhueOM87j8MCQZx9rn+D0MMJkmEQP5xghjArmKwxxtkEsht92/g3Ei0aSRl/3P6Cpuol
 52F1zBFH6Za/l6d8411Jv8KJGzJZFZE+mlXvkr37YR6hrKUCX+HL6+qkb7skCmJsFmhLWNvPK
 fw4c6ZAIMpTrJCWuIZ/EyFABWIv2i3+4rrwGWGIWks1ADKi3EAYs7XxCcktHUHHGMpVTI8h46
 Qxu9pPyJWKNNf3NbzJvgzmWGz66s2JU4J98yee8VeoXAMOs2GwhCEpkSPJ/lCn4Lajgzzi5eu
 h07oIK6HVVuGbsKNFqV8ujSexFJdHG2Wg9JtOOlNb8ZBMkPSA9SYZRfjP+z9iSGD/gd4zt9f+
 oGylYXo5cUnzeOobOLxSBKBd2ORgz7tkfli7hkFJ7M4YUFbUVoAsMx6zNEPFkFE03GUA4OZW8
 7kdbeGoa0dx2GadK+8VcYGJPpdYWZ3lesyxnysZp4srnwCpAbi+tLvOPj9m6LqsCGLtb/Dy6d
 MSjHC492dbwsHj5ZKUCEKoUsjjFWKjwh3wrKVuw6zm5w21UoE1rlY7jSfkM8Y6hEp2NvsPDpK
 hEs9MQd3pN3YF7pig4vRqBIxGJApP0KW+Rxz0gsGJ0gUPnaJJ8jcUw62tekZkiyBx/65IkTC4
 ONJ/WfE2p/n57uBEGBi2HS6N3YNtsaRW2HkaJZRtSk3zJxwBufmxq/0ErJbWt+hDV9dRRdzK0
 rP/9yVI3p6XCGtRuxo152HBa3Vid0V4Z1AjOL5nZZWMpKS2wSHgzmd2QmXta0/3oaW1zHnEUI
 +PUIURXeKJLDPASVwwd1PrlRCiJM1jCYpXM/YFUFg0NMyHIVEBChsaVZLDYQJliza7htSLQ58
 zHV0XBiZR2nKz+o59cgYEGjxRX2dmwTgo29jiziIwfuePMsuspcvOKOvxWCiVS8PpoMtP0Mty
 WA9dD/+vmKzDKyqLZ1UbrTZEpWnqrUVDN5bn12lsZxHSabcAF8p5pilQuahw79wKy+V78YM/k
 +vTqjEpgr1xBq7Ic3UFp8DLtNfHt6a6Wu3U5kx8R7vBMvV2aCcdTfpLnFwEPOeESPnfypG10t
 WgUHo6ch9RBE97cpcBMILlRTsrqVYc4rGQHKsaLGvTAQc5xlhvVgJTfJRcjXHpnK8lfvEe52b
 HgHa7tZGWuAdmDCplOI77qMWamtjFNRqWsupZihS1S2LnwXwghw58UwlrWGA1tf92bknLM0cb
 PpxSK8AVMkIGDP+6QwTx3PfM9NjAJMr8JSlfxXWx0rOJfxOm8fKNt4Jax27X2g0898+BVMmJX
 Tc6NziczuknuO4YnaC+XiqTC4LASKojUqpxLm7vn8hDni59E8vHqFrqz552H7y0M1atoHqxvx
 U+Rszmw9E6gX5nsnWP+ATMmx1lld4HQmXRMAEWsAPjre5CUNgYX1bNt38pPlIpJEJQMnh0WLz
 zhpu4E8OBT0umYvdsBHveCXjGSCO/e/HJBdvBUNTjezMSO+5DFg8q6N/Gma6OuxYtGcP0TRjp
 uFopwWjq72mNBm5tE8EMhS8hV4GOwoJzqaXrFJsQ9BvlLgmQEJG93qstRmHPd0PRcuveATuIE
 IASHvTSuL1nSpNiSBWR9JaJoGQFhHIwKmc8jPxMUQ9gAvJGE/bEHEYL/kdZY+HWG5kfaJuL8N
 FxB7ZDBQjlEny/UhPvPrDdfuk5ZXk4U/OVitswT6qLrpcITKRWmSS2E5igJIOo8Cscil7/DJw
 sLoQWqEBY3k8ZaR2+2UYU36t7DV8oMVtEhiQAWQMFtnpIX1RvH8Zb1/knd2dlrvhMM34lA513
 6ZPUJcbWokV4PYOY21Oztvb2jmcr4XgSrB6d5gKmgqN5C7cvGfw3ArcQfgK6dBbG3eGw8+kIX
 1q4Yayc/8fholCg4cNmZs4SMv4WbZE8JSQ431AC2R3tDcIqoX2K3i9cuix5oEtHFe5lcqf2HN
 Q/z4RRWXQr3Y4gtp6zug0nrHoCCkhBP2Gqm9LRi4GW/kQAZap3E+/FxnPNsm1MifeF9fMVIag
 nwkiDPTrR0I0g7NQZB7qTUfvS6ash2I5ChFgXYk8QMwx0kll2wz+gNTa6e4ikPW5/qIfNMtXR
 a2HG/m/QvvDhTx332IFRLpUKC7EamJWcgrgIT14LCXiE/ScR0dEpeTm6ab4AbqoU88LhNLRJ9
 g6l2tkw16JofqCGT6LriOcAbKMJdJrCZNzteq+uBcwViu/aEttTvs5ATE83DZqM5ke4wB/qMt
 DjV72K//pRjGdYNfGxfmecATxGa3YqxZMYvrPWtuZwmZVCrD4Uz5Ajx1weqZv8soppQzF3pVX
 NqriUAGz2gNmai0HhVOmtpQRphN3IJRvLyOUOeze0F3Ea3dh+GoZefUKqG/L9a8PTvP/y0Ptk
 MzdAUOeU2HW/0eY7mT1IP676RWQ/iUe6YcygGkkBVSwwGqpLTJ8cVaqJB+JhFVr+EY/6DMlhO
 QoCCl6ZXZDOVogXOTs7X1gkF3FbfdAzdk8LLPImrhiADno94061sRI/RaGtZZtUzHxQQy0PXD
 zVCf3Ks1S6V3Tdoeq5X00HpG5KHjsoaM+N2pufcaf4Th9a5JrfXP6oHmt4v7V9KlighDlef86
 i4G1XsCD7WaPxTREJbxFqSiVoES5ynY+TTC4BzMaNvgVLDETmvjEraUdTljGLuCq0T3HHader
 pEaIbGq05pq6r3EEzL/cpJh73Tyw9rXHR/jekpYjDU2KUrkqCHlLYsQQp3qsjJdZuavVNkCHB
 4PMx7WVHQe8tYCIp4akCDhRSVQdrI7EY3yCv+qJSQRY1roywjLf1HiUJvScLzv/yseb+pwoo8
 gsgYXOo0IzibklbhkRoiZ/7PrhFzSM7OkkaioYqG04+kIb7Y2z14fc9fwHbALpNMX2eDghWbE
 S3aZad+ZziL9V8eIDBuiLsRnAV8Skt0KiMSKIq7gEvW0TNaqFtH1fEW7mrFeaXL36iglgljjQ
 qQe2rqU/zQu75Ms+yklwbum49EsKFz9DfxNjIr1jn4Nu8P5ck9rFzSR7FeLZbJZnZ/l3NbKZS
 WckPWiGeIEkL9Xtm8Lp5s2Rn+j43VREkiGqPFaVS+7n8a+oTF91YFHWHRNnOVOuB0e6p6p24o
 6er411X03/oUQbjSPtr9/jPsp3w3Ercjo1IKaMOrDvIkmIQb4e2uikCBEsGcG2N8FNsVXWeap
 H8kOmvgWCrfqoYXmjljNlGtr8AWCDWCUijeYl1r/y+W+UM1LxQf6N0e4yw8HNHTysGvlHOHH/
 dZ7FHCUYUGnHRDZ3h4qr4DQlz4hzafOjDkLPcFpC0XGiCxrVkGLU/qcmDj63UErNK7b0vN1Y2
 j/bFfB0cQ2d11NdwjAF1zhC9IJ/IFto+aScb8c8cJBWZSfGtcapXt+P5tNmImn2yaKLhdkNfT
 RVuU+najYZHKOFEYY+d44FkV7YIVazzCKm4ziY6FT5LpGaov16SDRSNxWzBjiQO/HIgQtEl4R
 7Ue8IxH7tPvnwQLUVut/hHFgpsAYSYCFWN8rXwymkyDsyuy4BpJNPnCVdBxhnyq/Oltr5CDvg
 GKU2dAAWpS4NEpnyMTHkBcczkrniB+/PPPxzruIByHVpJXNKnIFUJfrE5+IQlyQHpJWtTu+5h
 lQHPfdpSpW7mGVIGLZeMZr3FfI2/AVFZqvJGlLzFJut55LVlUe+jXOaY0qoFZCmOTZYgT1Tiy
 wfCWCm1K4pebwIFtvSaPy76Zvevdso97/2tiKOrteW+eWKA5JJN9PZ4fPSKO/qM5eCM0yNBK6
 dtH9lm7ZhRBpVNPcg7wLYlbQKdKnJOFEshXr5PZJaLMrvTctpHcCNSUtNZXzO2i9RCTRwYX3N
 VE9PQdYtDtDTogZ2NCRVZeg/Y9SHHk359ooNMuJQ5TIQFf9mOqnK9axR/R7+Esg280Ivts9xb
 OU+L1PRheXsRlq2GN/jscIF5ZP8146+GjTdcfCW1SHWVe5mvm+gNorXsZ/qYCZLZ0fwHlI2C3
 fVlzNqFdaR2Q3lKpi3Pr0qJhSJRMxcWoVwa79Xh+SZwbP6prq2COvEzOIoD+YISbb5rhOpsM/
 GnXzZEjQn7onhCJaegBAbMAlQObtFlLzz3OmI1R2OqdNpIjZaSxrkIFE1u2TfIw0Qpv89ywSm
 mFOcqdLzEDnbXvpkdkb2SsyBVRTM40cabTOaDKcW2bICsN23/1IuOGqmz+uFd3nt3l4a6FLy9
 FKT6jqjURaSmkVo6QiQx574Ygl3ivrlx/ajZb67qaVE8rVXlashA5D9iOowlnEHzdxo2Y8Xsx
 9Frw8BbgTxYAjT8ViEsMAfOHJPRn0cCr8mAKH9E7ZPhiPx6BfalgAWhubsgm2nFuhYCdHChCM
 eIMCEddEqHdv28xJMxkoahqP3nd0/vRVTxGWVozJ1bfW58L/ofX419ki5w5WRCsRYJWYnH4hl
 SCSJfbL1jkqXAQuNaDMesIRCf3N06rDQvndxhODSS5xdaPUH6E/qiqDnj28NKiwKpQ4kBci/k
 dLnuo4PXrt5JUA4r2vDFR4ILLVLY6Zq8MFifNTWHQsjkmiMumebBZhTKwByuS6D7velGtaejm
 0mYDgAKVUXHJkHC1T6TsAXF5rwP2hOAsiQ0vmjMX5+4NAgF9Ddff+t8Bo4UoLClZegM+PKSq8
 XPuVQwKViRGpNHglc/pRVJI2Wl0Jnhs+2N9ZBeE/j7c7KwQhPiKusySk8U9kIZiE32Lq/JjPb
 KbCTcWydr9jC+awJfhKFuHef57VSBW9LDHF56auLUG92ptLYjT6T/TpWxDgT3vZ44fajtVGQB
 sxp0ZXc3fZH9efWTh7A89/rnLGSKmTR+mOgsBrYckWIZHnL9mjBMEGQpn5oa4ohY3ClW4Qwme
 mT+Sf2C9EmQsxuGke7tKE5Ft3++Wjy1V9GFR9+G2JlPB9oSDa5VJDkzxqnyQzjKDFMAmJjFLb
 aH9crvffsCRfMt2ToZO+UWmejFwS6ocwEobtUMJDiTrVesikvJnV1fJ4FERlHc21HUwgjFrLv
 Jm7ab7iXus18Cy5BZIVonEPZq9awWT8WyAF3dLjHJIdrt4+UR6xUdhJPkMALrpQRmtMgHLeEW
 VZ9nCkWocUc9kVwYTt8YDoZFPYdOjYKdm0cRFB4uSfJLAOKDR6Xa4I/FUcWsjUjULrMXosktC
 xpUuy0lhBWHEvRORltlWYM6KAO++0/sDPvXLAJrp22MWaYeeaP67MbIJxV0+gGxmennB+n+6A
 Thty8TWaFoXRsYwdElXdSGBnYvRwZprSoN09ytME7ZbiP0Qi9YgOgWXtnjEyVkLrbY+oHRRzl
 H0BaKTuuKGWdOFUN1Si5JvesCzOWVRAFDSXY4c/Lqeaq9fgo5SNIFnONbWBQ4HZ2pw==

Am 24.11.26 um 18:42 schrieb Brian Mak:

> On 11/24/26 06:57, Armin Wolf wrote:
>> Am 24.11.26 um 15:29 schrieb Armin Wolf:
>>> Am 24.11.26 um 00:43 schrieb Brian Mak:
>>>> On 11/21/26 05:49, Armin Wolf wrote:
>>>>> Am 21.11.26 um 01:05 schrieb Brian Mak:
>>>>> Alternatively, maybe the wrong backend get selected. Currently the
>>>>> dell-
>>>>> smbios-smm
>>>>> backend will try to read a specific token in test_wsmt_enabled() to
>>>>> determine if
>>>>> the WSMT ACPI table is active. This might not work on arm64
>>>>> machines, so
>>>>> maybe parsing
>>>>> the real WSMT ACPI table would fix this problem?
>>>> dell-smbios-smm is not available outside of x86, as it depends on
>>>> DCDBAS, which depends on X86. It would only be using the WMI backend.
>>>>
>>>> Thanks,
>>>> Brian
>>> If i understand the ACPI code correctly, then it seems that the WMI
>>> interface interacts with a OperationRegion handled by the ARML0002
>>> device, associated with the ARM FFA interface.
>>>
>>> AFAIK the linux kernel currently does not support this device, maybe
>>> this is the reason why all SMBIOS calls fail.
>> After doing some more research it seems that the associated WMI method
>> tries to call a ARM FFA service using a FFixedHardware opregion.
>> Theoretically Linux already supports this, did you enable CONFIG_ACPI_FFH?
> Hi Armin,
>
> We use FFH offset 2 for this, which is not supported by CONFIG_ACPI_FFH
> (only supports offsets 0 and 1), but is supported by the nvidia-ffa-ec
> driver we currently carry out-of-tree:
>
> https://github.com/NVIDIA/NV-Kernels/blob/Ubuntu-nvidia-bos-7.0.0-2022.23/drivers/platform/arm64/nvidia-ffa-ec.c
>
> https://github.com/NVIDIA/NV-Kernels/commit/699ec3dcc62ce09f071625307079dc7d68d8767e
>
> Thanks,
> Brian

I see, interesting.

i took a closer look at the ASL code inside the WMBA ACPI control method (responsible for handling
SMBIOS calls), and i noticed that the ACPI method will return the output buffer unmodified if the
FFA call fails.

Currently dell_fill_request() will initialize all output data with zero before performing a SMBIOS
call, so a failed call will look like a successful one because output[0] will still read zero
(aka "success"). Maybe a solution would be to initialize the output data with 0xFFFFFFFF so
dell_smbios_error() will detect it as an error.

I also noticed that the WMI method will return not enough data, so i think all WMI SMBIOS calls
will fail starting with kernel 7.2 because then the WMI core will employ stricter size checks
for the output data. Can you check if this is indeed the case?

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>> I also noticed that the device supports the WMI interface used by the
>>> dell-smm-hwmon driver. If you want i can try to enable this driver on
>>> arm64 too, but IMHO it should be considered optional at best.
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>>>>> Thanks,
>>>>> Armin Wolf
>>>
