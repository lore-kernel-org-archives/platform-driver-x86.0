Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA9633CC0
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jan 2024 15:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705850224; cv=none; b=YqX+z9yzMDUFjrs7umWt2UYxVaU5B0EQzIuDQ/W3wdXAgxWdK0zciXIST8sIU+4EFvR/nZXezN07AncteDCAiWqAIDryxwUAekn416/mn81B69Je9K0JLzo/SVrfX8xqoKL8HjOx6/PoNkxZPmJT+adxjm5A7nVoTuRgjyDwYnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705850224; c=relaxed/simple;
	bh=9oqUZWh+vmfAWtFliOyDEsguQx+IIZZ5uKq55/4JMdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riMAwVRA2/hgX5rD0MHJ2ZMLv+Y+MDkq1octF1YWolWtfmcaGd6mzOe/gU/U0+Adh4J2CJF/81DRAbvHeRgLmY65c4ze2mPkqkhXUkplvypB4tLgJJIM5610sBW6PN7OLMF0t2uj7qKYELG/SJkdRggNeUwNsmqMJ/L1CRNzxB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=EKV7AR6q; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="EKV7AR6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1705850215; x=1706455015; i=w_armin@gmx.de;
	bh=9oqUZWh+vmfAWtFliOyDEsguQx+IIZZ5uKq55/4JMdk=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=EKV7AR6qYgUQ3iT+yPcTyvpNgrCdMbzzuvlSUCE++5n3HqmoeLmpsWKro7VXPpBO
	 b+sBX/n879pblpqxHDDr7N47DjZmwXQm1T1v0Ogs/+K7ttFvEGL4jMQrCJgQ3AEQp
	 pEeZDIjCqHqEBmDgGLFIYoD3ddwJwqTC247/2jswUac9+RXNnyPYCObKuYas0btes
	 R7vvj3jYnjaDmm5wLILSRLkeuu8xjX47akV1Q6BHIjDftb85JF9Umt1xyXiELOGLB
	 ENNeLwKeuzyPYqnRzU/t3ymzN3kYlTb3hLIqyk9wivZ8FV9FR20jYMq+eRgWoaOUj
	 MAN03QPvdPKYInK0oQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([91.137.126.34]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1r6sv50pX2-00uHGU; Sun, 21
 Jan 2024 16:16:55 +0100
Message-ID: <e97ae805-d006-4f0c-96c0-976385772bb7@gmx.de>
Date: Sun, 21 Jan 2024 16:16:54 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
To: Dennis Nezic <dennisn@dennisn.mooo.com>
Cc: platform-driver-x86@vger.kernel.org
References: <ZawX2mquuTCv0tuF@panther>
 <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de> <Zaw9mnfEL65B5r4O@panther>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <Zaw9mnfEL65B5r4O@panther>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:sO/79gxrGKLDf2Ys/tEzfiv7A/ie4uGDAyVjgiZ5hDvLjnHcIJv
 HOypuhQsFD2lZXTD//rIpE8fwkveERi8oxBQeqNYrWyNeCGRtJICWsGbbZ/WFe6ULwUGmtE
 +0LC4ejpCgQnJnq5v93Mft+vNgaoFqzSjXaKBOYWRlNQwQhUHYVaod5T0WYXF6MujYbi9sE
 Mbt75/Iox+DplgyEOVmug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0WR7zAHc5g4=;mEvjr570MGTdR620RoCfPmuhYgM
 ZxhzBZqjtdaESvS2rVkqeCFQgmwilvLlybanyF2SVodSsEo7Wg0zxMBbAxLVwUopHiu6luiJi
 WNOrZmTGmPkoIlHYwLhvSJqgq1Iq1yjDg3TjZU+A346A1p9Ggm5ZtWOUW3EmJMd45ydKEqnEb
 +flM8O9pwiDR7SYxbaBIsLfVRk+pOpyCNBTNIbbVPWwQo5bypnGLfmHc60QezeX6lIuSCQBIe
 XXtnlkmFn5H1Ybpt6b2Xm7qz0ZEvDFU93jMQuESKe24at8v2RWB5Fks1hI5oC7LcgtGNL6rDv
 wTQHbpDQMMvx5XeJp3qy8mshIjWsLyibU6vyfg7hIOwy/rPnVb1I6pu7Yy5j9hxAy872yAvMS
 ruPuU5WC+1FUV4fZMJ7yXViRotFPArurU9/Xo6yle2zKusbP3RDyQBG/lDd8+wT9pBBvD66P+
 G0a6ymdOPkyWOy539+sXMLN3Q7GL1k1SMNS+mHuLMW7jKurpRYbZx+QkYW69yjt8W0UV5+YuY
 1YAgdzDjsvZsqB1c7ITP38ePHcWerJ+5pk4WFSAZ1Nu6pacJxH7kt56Xlb4nR9YgMeepbuyMz
 xLBS/McCEXXX9KbF2DMaK9JlDUmAwf8zgS6J89/B5jnsZ3wUc9+j2hz9kkO7JkdIsrD6Iy24z
 TnXUywlZ0jv3VTTc94MdEWgJbmcHFuZ3JjmshEuRM2nOdQOrHkfQ4j+m8DM04/0tiKp1m+V3Q
 Wvzp6Rv7WdF4MN+V7dZLOrgv2Vl8kb2Nwnq7wOVqR7AwE154Pq5UEItgiMcQrIEwvH6xdweZV
 0o2KTP7GkniCMgdMOG4UO6K1Rw0ZSct46Artul83UyRTJRlv6uhFbziSrIsSYMPk7EhQgIeHF
 MicKJ37aOL3uhSBqbM0U1tavnhen1AumXNKv3gRlGjkbPiXmQNqtahCBJ6jqV/BX4lDo/lWw2
 ixQ6b2L3GZlUwgyLm5O7is8WY+U=

Am 20.01.24 um 22:39 schrieb Dennis Nezic:

> On 20 Jan 21:52, Armin Wolf wrote:
>> Am 20.01.24 um 19:58 schrieb Dennis Nezic:
>>
>>> Guys, the "info" illuminated touch-key (hotkey?) on my laptop "doesn't
>>> work", showkey doesn't report any keycode or scancode. I don't see any
>>> wmi related error messages from dmesg. All the other illuminated
>>> "hotkeys" work fine, although confusingly evtest and "libinput
>>> debug-events" report that they're coming through the event interface
>>> associated with "AT Translated Set 2 keyboard" instead of "HP WMI
>>> hotkeys", but hey, as long as I receive them I'm okay :p.
>>>
>>> hp-wmi.c does seem to reference it:
>>>     { KE_KEY, 0x213b,  { KEY_INFO } },
>>>
>>> How can I go about troubleshooting this? (I'm using kernel 6.6.8)
>> it can be possible that your machine does not use hp-wmi to deliver keycodes
>> to the operating system, but instead emulates a standard keyboard controller.
>>
>> Can you check with "kacpimon" that events concerning a PNP0C14 device are being
>> received?
> Very possible indeed. "kacpimon" doesn't show anything when I press that
> touchkey, but it does when I press all the other touchkeys. (I do get
> lots of accelerometer noise.)
>
Interesting, can you please share the output of:
- "kacpimon" while you where pressing the buttons
- "acpidump"

Thanks,
Armin Wolf

