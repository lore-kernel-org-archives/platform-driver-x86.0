Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F32EBA4B
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Sep 2024 15:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896361; cv=none; b=u/ad7I48wqr5CKdNsipXnNnR+XoWupmHjM5DHgFGQuFar+AqrZ4l/tx3zZqNx0jkdK+5zIEtNtQC5o4WOqUhT5210p16R7SBaqZ1DJIJFHwk7dLhu3TalioCkYg/4a/1vbQMFClc0FvID07dHxPzEw9VeVy7CnrXwrYRVCPq0F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896361; c=relaxed/simple;
	bh=mTxgP5rRNy8qeHQ+LG1xw0f3rcntLawIN72w7p5fPQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=of9a28mYk+vUE1E98EaO8K5BMYel9Go7Q52OXx82IS60SB1fPx1yIQrsMPWIixHZWCQas16/4S5sd5UPVG1XT7vjMajAP6NcpJXPRvSAape4mSnug2mhC6+6plokQ3t8hxCSfyLPwzWVfGX86jKaiwkLvhgtEm/PEX6kMS4RlqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=WzXrKFZn; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="WzXrKFZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1725896356; x=1726501156; i=w_armin@gmx.de;
	bh=mTxgP5rRNy8qeHQ+LG1xw0f3rcntLawIN72w7p5fPQI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WzXrKFZn8MqxxMz1i4rB85j2vSZwEU6oZX0af7liSeOfBwFQ7VLQdzkN45t55lVW
	 2re62oyNF56KLkTqdy/YmkhIFUjfuuOM0csOJw8Huc+48F5212V+5+9t1Ma9phtti
	 IhtE2CkAhV0ondLV8X1dnspF4r/6wJORzftCCP1554u5vv+FxotY8+eXvz7+gkoGG
	 Q9sqMomOLz9oJTM2Qg0fFoRFt4aMIof8zvxT+Iz/jNzwcOMH/hjUB9vfz6BDkdunB
	 3DLn6LOFj1mwHMuWT10Uu3LdBaN29UcGjetWgfzBTNMAnNONfd2eO5HM9txxfn3uF
	 CAwVVGDJwkx1R9cgVw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2V0B-1s1o1D1o91-00rPrI; Mon, 09
 Sep 2024 17:39:16 +0200
Message-ID: <bbc42008-f121-4710-a27d-f32b9deabcac@gmx.de>
Date: Mon, 9 Sep 2024 17:39:16 +0200
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
References: <3c63701c-f9fc-4f98-b991-58135da3fcc3@gmx.de>
 <62891F43-E938-4DF3-9E51-9CCE19784DA8@gmail.com>
 <d8563b6b-8ab8-481d-aeba-656c38dda2ed@gmx.de>
 <CACzB==5oz3xa9ZFRk_xF8qDpzvKQcdjpKTx1mvUENkkZvLea-Q@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CACzB==5oz3xa9ZFRk_xF8qDpzvKQcdjpKTx1mvUENkkZvLea-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:gSmQFgUMdW2xoGSlb4isrgjdxyJyrbfOJVT5ct/LuxHr4uaUBGb
 NeW6DKYug7Q976soMoHfS1k9Ihnx2vpqQxoh33lPpuWq4uSUs6oZ2W2PIhwaDBUVN01KhD1
 /2b8BLGlDlXq+tGrUA7XyD2Kv0jHQ8lHp5bYsqbXjEQ4APCbjlqihdDs3D1eGpvlHMtdmDO
 szIEPkrYNywugDBp+wErA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aYzFURE6JAQ=;OjrfHxk5NS9LSFgBMQYv7vyanbU
 O5rdODpBVZyd0+qtL5Nosd91+m1+OO2IYAw1bRuKF8MGaWO+ZV7DXHxeb21pKPc/VTfnw/xbE
 XE+J2ao4hkTWs2kjHnWINZsgS9swf4mrtwOAEcZy6DmJJbCVVq0RHTNU0uN3ov5Ip9PaHLS7t
 +YxhXiAs6it8mhIZF+RIJGfru1AxYKbFZk4RDzc7bLWahccb8/FQcJvIOX7gGM/jDMODKQI52
 6hIddadZ/7m9D36SccCIXw8UM6NPnl6TPJrYRxCREHxy0mbxDfkzot56lK4vAsn+J5v+IvYzg
 lQ8JJEuyMjuckAboF26pfsi4cfay88Er2A95SH+tKDNoYuSAYdUGrE8HFB5Nh7PBGqgfJe5q6
 Bo8+Yku3UXShRhBbd3klztZQr4sf9FK9mEyDtMWyAWQQuaiq/3AJ3/UVHjmP5d3fqW90Jy1i8
 OOeDYA2irMcIH8ryx5fttoeKyrnkqdC69cj5NNOEnm6uFJDmkMpy8YcZPrShCerlvIhQe6DJm
 GpnMxSfKO5TQhUoegpkLQOfWgoB2he7CW7gzNlFYwmDiXe3KCe7aEe8GiRDQfQ1vLrUwEzB8W
 +ofy8PJAEAwWlo0VUo1GF+cfYuXEofiauDDGU7UX4llcWbAMmOwPON/AbNEMuwRRoAfwjaav9
 434VPbsVdpUS0e67gJbgn3ECHy3GiG0Vf6cMxyZkj+UUtp3bA9tWNeJiiFlJUigO5g9oLRZuJ
 Ds43PeOy9QAsSXHLDO/Y4s2v/h9wQd8QQC0hD8wCkKvqLBMvjvZUELc4AinGLJeDDXF0BBKBM
 5j8Xo4aB7UBbdKvEMCXwwZxSb0udJw5aGjj8YHkSMg11E=

Am 07.09.24 um 16:04 schrieb Rayan Margham:

> Hey Armin Wolf,
>
> I found something that might me quite helpful,
> 4,1289,478717534,-;acer_wmi: Unknown function number - 9 - 0
> 4,1290,478733471,-;acer_wmi: Unknown function number - 8 - 0
> 4,1291,1751600805,-;acer_wmi: Unknown function number - 9 - 1
> 4,1292,1751612580,-;acer_wmi: Unknown function number - 8 - 1
>
> Thanks,
> Rayan Margham
>
Those are unknown events received by the acer-wmi driver. Do you know
how to trigger those specific events?

Thanks,
Armin Wolf

