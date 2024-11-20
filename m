Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDA32F2A
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 21:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732136897; cv=none; b=OOvdK2SzN+3pKuUuoTDGl1f0w/6cNISMNeqY4XXepE8xNnei78Lo1mAi4RoLoxnsqQz10vSrTnH+M7zvU8SBmF5S1LHs+iqTgmbpkWHw92zsj9KMtVkLCyR3bK9XKXwFE2tz1y8SHJzEClubJuYDCdqB61kgyIccvbQlxcjP4dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732136897; c=relaxed/simple;
	bh=e7xxtJ51fIdTdq4WcLix5ukcAk+DoluOLvnEArtBJg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djQhZy7eUsuic+Xi7U+9Tluqg8t1dC09mAI3d4ebsOp9EO0hif2KJXS+rcBqf2MtpnUxqFqG/kB7jkK5gdBeIxvrr7d8Za9iqDfojOtX7nppyYdwwXACHFeSafx8VL273uFW4Y1Labcgim9SnPA0etl4Gpmsouqy+yBzjrp+6z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=NtMRN5BH; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="NtMRN5BH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1732136881; x=1732741681; i=w_armin@gmx.de;
	bh=zD8DBez5PF+7Db6eTrkPwjTZpkuEhsq4X9ROH5J6Ceo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NtMRN5BHeoLOpO9DmuxT0xlzm5DQJlOIlxAmCEYFjekgj3atRZjb+rlcziZA0evI
	 SrpqyARtHtv86mhglX8z4owssnf5skb3dro11renfiKAtfme8xKUt764kPDN7eZvX
	 xJ4WA1xcqSJ8EI953BrR+009F+eWlQ95R3udmI8m2GU422mmi4ZzcYphYq7c/UfV4
	 bMlWCbgVRYehWveRj1n+0baBx1POBo2GN4KidmH00C+PZq36y1QC0FNDAPuxgpoqS
	 VyL1Q5yUGl4IGMrGn3iIyyFXEZ/3EgU6jnDbkWUtW0geKO3gJ96E0GtFrU80SNxGo
	 MoVnJBFJZUm6qI1zpw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([141.30.226.119]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYXm-1taZcl1PQ6-00ZY3Y; Wed, 20
 Nov 2024 22:08:01 +0100
Message-ID: <9692d8cb-68d6-48e3-9830-8c74da3902ea@gmx.de>
Date: Wed, 20 Nov 2024 22:07:59 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: alienware-wmi rework RFC
To: Kurt Borja <kuurtb@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 Dell Client Kernel <Dell.Client.Kernel@dell.com>
References: <6m66cuivkzhcsvpjv4nunjyddqhr42bmjdhptu4bqm6rm7fvxf@qjwove4hg6gb>
 <bf238c08-1f49-4e16-b9ee-1d1a5e0b9763@amd.com>
 <uyzgfmsbd6dkeyx76fmstqpauj4ulnz2eqbww6dz7fwjxwxer6@vwuebqbtl5e5>
 <7ce64458-4390-4630-8d59-66e37d6f4521@gmx.de>
 <gz67ujg6ggqx7gq4grm2jzi7assjzmcches7dmqaky6qi2fvjq@kkkbkj2z7i5g>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <gz67ujg6ggqx7gq4grm2jzi7assjzmcches7dmqaky6qi2fvjq@kkkbkj2z7i5g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6jTvC0SXTNrbD4WWKfcBkkTIEz4cH6syKUCknLkxNsyk45mkIIB
 hwnDs9tblBeew132PrdA1hnvU7hMKpeUyE0gs0372dME7/pvXWA2KTv0UYOrPTh1L6Q3EU1
 fRdfpYKlGd02JUgZm+1D2Mq/agBDd2U2Gv3VqnNTbqtP/Nl4WQZNRNqbv3PDak8WtN9+ngf
 vStk1adnF0ErMZFs/1Oww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:E51N0nARYuM=;ogoNgzLrCwjE/MftOUJsVPOTDad
 DiQEvfd160CPN8rct8gZxGHE+Wk7CbsWvMXpSgmC0zqVzzJfLvVE7DzydPRcAcsLmrH1O+kmu
 AQRfkAryUrQCq6rpR/K2/DZ57003K4qphrFLD0DhfjPYSHOglkqNmhTFmQ45Qoc4tEko5pNQs
 /Hn9Bo7tYW0SLoZx0JBMQtbF4ArAxxMaiAGPQ83pqJfrXIC1EfVG+zGnp9QruiOloBH/hJVLm
 UOf3S9/vRapHNFRNYfXKZv5a1ATRadV+YF07ygWLiIs9N20rGEU9Xz0CJ2yU1cK/svZi5I5tV
 1vzllwrFMHTBVcnRjjN1+Zq1USq3xJfzfbYXozthZyC9EhX/zgGmGu1tj3iSbLCIZPoss2Y38
 qH1p00x7GXLfw7FkNEeBaheVYlIPCkbJNBp0TY03r2KwAGT0fW7b1jnle4rKOwfMH5FhJ3MN9
 U6n5PMIZhyQuYlLKCr7JvGVOl6kjmrW29xV8HgkO25In6AaVrVySgfOQgBFZyq42Nqye48/Z8
 1B4Iyf6/jq+1d/N3nvDSvM2NKtMBL/FHYVFb3LTeALZ4FNaUcMO6/Y9Y36xzn5zdHGQMM0TU/
 MvoxTlh8yw7/VF58zrWbMsmgFs/XBvqbmvcCzHCLuHyL27JPJCl7I4jB9LnAI0FewYdl3Ktyo
 tcGQ1JV1wk0dTX52sbsU8ZTL5zMhGSDF7njT4tMxsOOVobabiS+Dyg/ih5wFr07JXaaSF/DTD
 H4EHSkqfbP4v+nVgvTBvDhCbBps4Qz55yHIZjbWfsIyaYHG41RbIGrSEWLyzo8i/HsEG1S+WG
 Qci4+oD+sGSEm/g6oNtkweohtjiXJ807kb+oqIAacC4tlmj2FjAxJN8kd3FD6XwUpXJcVAvqQ
 vP5elhz8H9rlslDzh5E4qM+Th2hwccWKaMLgmjrWC7JCJlAIVmtC9LLB+

Am 20.11.24 um 16:04 schrieb Kurt Borja:

> On Wed, Nov 20, 2024 at 01:06:57PM +0100, Armin Wolf wrote:
>> Am 19.11.24 um 05:29 schrieb Kurt Borja:
>>
>>> On Mon, Nov 18, 2024 at 09:54:25PM -0600, Mario Limonciello wrote:
>>>> Loop Dell Client Kernel M/B for any comments.
>>>>
>>>> On 11/18/2024 21:47, Kurt Borja wrote:
>>>>> Hi!
>>>>>
>>>>> I'm planning on migrating the alienware-wmi driver to the new WMI
>>>>> interface, as it's currently using the deprecated one.
>>>> =F0=9F=8E=89
>> I like this :)
>>
>>>>> My plan is to:
>>>>>
>>>>> rename alienware-wmi.c -> alienware-wmi-base.c
>>>>> create alienware-wmi.h
>>>>> create alienware-wmi-legacy
>>>>> create alienware-wmi-wmax
>>>>>
>>>>> The last two files would not be independent modules, just includes f=
or
>>>>> the base module. The base module would be in charge of initializing =
the
>>>>> platform driver plus the correct wmi_driver backend, but the wmi pro=
bes
>>>>> would register the platform device. This would be very similar to wh=
at
>>>>> other dell drivers already do. Aditionally I want to migrate everyth=
ing
>>>>> to the state container design pattern.
>>>>>
>>>>> I would do this in such a way that the legacy and new code would be
>>>>> completely independent of each other (i.e. different state containte=
rs,
>>>>> dmi checks, etc).
>>>> As the original author of this driver when I was at Dell I'll add som=
e
>>>> comments.
>>>>
>>>> The 'legacy' code was very narrowly focused for supporting a handful =
of
>>>> hardware specifically for lighting control.  One was the original Ali=
enware
>>>> steam machine, and then a few generations of the X51.
>>>>
>>>> I don't know how much of the driver continues to work on hardware sin=
ce
>>>> then.  Maybe Dell guys I added to CC can comment on how much of this =
has
>>>> stuck around over the years and keeps working.
>>> My guess is that none of it works on new models. The LEGACY wmi device
>>> is not longer included on new machines, as all lighting control is don=
e
>>> through an EC and the WMAX device was repurposed to fan/thermal contro=
l.
>>> I say this based on exploring quite a few acpidumps and a couple RGB
>>> control Windows open source alternatives.
>>>
>>>>> Pros:
>>>>>     - Modern interfaces and design patterns
>>>>>     - This is compatible with Mario's upcoming platform profile chan=
ges as
>>>>>       the WMAX device would hold a reference to the platform device
>>>>>     - Would not break compatibility as legacy code is independent
>>>>>     - Easier to understand and develop in the future
>>>>>
>>>>> Cons:
>>>>>     - Initialy alienware-wmi-base.c would be almost completely legac=
y code,
>>>>>       as new features don't require a platform device (yet), so
>>>>>       alienware-wmi-base would basically just register the wmax wmi =
driver
>>>>>       on newer machines
>>>>>     - With this design users would not be able to completely exclude=
 legacy
>>>>>       code with CONFIG parameters
>>>> I wonder if you're better off just having the legacy driver as it's o=
wn
>>>> kernel object?  If it only supports a handful of systems, most people=
 won't
>>>> need it compiled.
>>> Yes! I'd like to do this but unfortunately some user space application=
s
>>> might depend on attributes being available to a platform device named
>>> "alienware-wmi". This is why I wanted to have a unified "alienware-wmi=
"
>>> platform driver.
>>>
>>> Thank you for your feedback!
>> It see, that is unfortunate. In this case having a single driver which =
handles the platform device
>> and calls the right initialization function from the other two files so=
unds like a good choice to me.
> I have another idea:
>
> rename alienware-wmi.c -> alienware-alienfx.c
> create alienware-wmi-wmax.c
>
> Both independent modules that can be included/excluded with config
> parameters, etc. alienware-alienfx would register the platform driver
> and the wmi legacy device driver, while alienware-wmi-wmax would do
> everything independently and only register an "alienware-wmi" platform
> device if loaded on a 'legacy' laptop model.
>
> Of course I'd make sure a platform device with the same name is not load=
ed
> twice.
>
> Something about this doesn't feel right but I don't know what it is.
> However it is less files and less memory footprint, because ideally,
> 'legacy' code would not even load on newer models.
>
> I thought about this because Mario said legacy interface is only
> supported by a handful of devices and it seems like a waste of resources
> to load unsupported interfaces.

I think the WMI driver for the WMAX interface still has to always register=
 the platform device
since nearly all custom attributes (deepsleep, etc) work on the WMAX inter=
face.

I would prefer to have a single driver which when using the legacy WMI int=
erface will only provide
lighting features (correct me if the legacy WMI interface supports more fe=
atures) but will provide
all features when using the WMAX WMI interface.

The overhead of handling the legacy WMI interface should be acceptable sin=
ce it only provides lighting
services, so a lot of the code can be shared with the lighting code for th=
e WMAX WMI interface.

Making support for the legacy WMI interface configurable when building the=
 kernel also allows people to
trim the resource consumption should they not want legacy support.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>>>> After this I want to add HWMON and sparse keymap capabilities to the
>>>>> wmax interface.
>>>> =F0=9F=8E=89
>>>>
>>>>> I'm sure there are things I'm not seeing so feedback is greatly
>>>>> appreciated!
>>>>>
>>>>> Regards,
>>>>> Kurt
