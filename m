Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7DC651B3
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 19:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="M9z2e3TQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1703187916; x=1703792716; i=w_armin@gmx.de;
	bh=uDt8tvOPaMw2BiwbCMq5Q99s5vYcABiXSpy8ygWEZv0=;
	h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
	b=M9z2e3TQs7ueb3gkIn/UnmSfSplGj+ra5P7smOnboZEW4J+jlhcFOhFlkADboRe/
	 oGopZPF2Y91pkOohK1CNWyXxL++QrC7C51VfRxbty2GnB4aO1Bjwm+Yosz5RRYazV
	 PIgm60c9GKd9GDscCWKfX6A2a0ctC1T76k8FFsdQOrnPAP6PlMKzDfKUY0IOW0v2G
	 ve5bhViqdJokBDu9Xz5M9WRegegLzahWTkCveuNb5lBTe0wKCN9gBLiSLt0Aq2Rw2
	 PmZloE/9csADxcxkDMTkMJFAvY3P4aN2m4r6e+/Lz/2U6CkGT93gBU1Kn/DT3ixQt
	 WOyfAsXh+0sDBAjbyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mf07E-1qoD2M1ExW-00gZl0; Thu, 21
 Dec 2023 20:45:16 +0100
Message-ID: <8826e9ea-c0d8-4323-80a6-7c75dfc1a70d@gmx.de>
Date: Thu, 21 Dec 2023 20:45:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: corentin.chary@gmail.com
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
From: Armin Wolf <W_Armin@gmx.de>
Subject: asus-wmi WMI event queue handling
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vdcuJhstvP55pDTHS2VzEbUBn6OLLLF11EepFDdr6DKxZD2FZ/f
 cZQcx9rC4X9zmkc0pbMjCIDX6dNXecqZTTZ6NUoIQw2yRRn2ED2kwPTzXNRry0Xkad6HSoL
 8LRNy3SGvIvzaXmnFWSeYwuMO2YnDtoXzKCF8wn0Sf8RdQVzD3oJCkbQ8HLaT5+L4L0ll6B
 7GLcnI4ZHaGdK8t7qWm1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BCB2Pt3SHyc=;Tz520vBALy7qclGUrsrnVTA0qPK
 UjTfCck7LGZ9UQzI6kp6Ejq+/x3pqU56PbBXolnK/zC8iHacV4sQ2S0kdMEo/zf3v1W14rnQG
 VrDeyc0JWCmhNmra3dE+IBFM6n1deMI36Z4jlC4Vj41cVUeDkIBM3AJtO6Mw5dQNbyozQusWK
 N9h5U1QXadWyS3etTzZNfRktJGktYuF7/eq9VQLMoU1rUPW+RTskVWl5E0LMklYhVDrGqamTg
 PHzvwzasRDMO44BsZgoSAfpTwe6fz4XpJbNVcDOLO6PU9oiHEl1aaNdAf93s9B2CoFOVIuDK+
 mboojB0xdAw83NMBcSfYIHHYnVlyPGdIyjbQ98hxRzCII/avN9WDfzjUNzBcRrrLWFsWaeO/e
 rcrrz10K3hPIsjB2h4AzvN7Jc0L2S5+iSjyGRwqXexzeLma0pGnKkSjDRJCvxyppluRGKuPrc
 tXv3rQpxJqTzI16elnH6WLV/Dg6e4rMUnxJON21YQqCSmVxIzpBRwXXsa5/HUpzIG+cLSJ/15
 AzQpcH34veSLANHzURPv5IfwAlvyzfMbNrfcgNdE9rP9op2eXJwlUpmyQAZ//s5qNWCFRoAR0
 Qd1MncnwaiEjwaWhl3bWEvsq6VV16k+wFolhYQWsRwYv8lrPWhOqCq3kxlSDba3BnqqeMpjA6
 4QJLU/8cWTKmtVYu6shdq4GbG8fOzFv8KYAB5ADBFsWncRx/rcXC/0vDGG9w6rPzak86HuFKU
 xbQ2RoPB5VsPX8cy/o4z0+q/4DT9AXoy+ni7YVNTLhPB+wA4XmLXwBBscURRq2vwbKVtrEGa5
 lE77Slrz+gY5gaFNB8dxXvQu5WBBQJXuZBP2mIzc/kl9hHHY7YMhh6ZOU6H/nCnme2oMDlVj5
 ybnRhPPOy/omB5hnXxlRFF3vO7cfOBLWtVmIEDhj7cZHOuZaRfZCGedETnY7hKGa/vI80xTy7
 tBexIh14f+S563rAqvqJ9x0HfOc=

Hello,

Since commit 1a373d15e283 ("platform/x86: asus-wmi: Support WMI event queu=
e"), the driver
flushes some sort of queue holding event data entries during probe by repe=
atedly calling
wmi_get_event_data() to work around an issue inside the ASUS ACPI code.

Since the whole driver should someday be converted to an modern WMI driver=
, this behavior
could turn out to be problematic since wmi_get_event_data() is not support=
ed when using
the modern interface.

Because of this i was asking myself if this issue could be fixed inside th=
e WMI core itself.
AFAIK the queue only needs to be flushed because the driver stops handling=
 events
(more specifically: stops calling wmi_get_event_data() upon receiving an e=
vent) when removed.
Looking at the WMI-ACPI spec, it seems that the event data should be retri=
eved unconditionally:

	"The _WED control method  is evaluated by the mapper in response to recei=
ving a
	 notification from a control method."

It seems that the ASUS ACPI code depends on this behavior, here is an ASL =
example:

	Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=3D0x00-0xFF
	{
		If ((Arg0 =3D=3D 0xFF))
		{
			Return (GANQ ())
		}

		Return (Ones)
	}

This could be fixed inside the WMI core by unconditionally retrieving even=
t data upon receiving
an WMI event. This would then allow asus-wmi to potentially become a moder=
n WMI driver in the
future and might even benefit other machines which also depend on this beh=
avior.
Would it be possible for you (or someone else) to test some patches on an =
affected machine?

Thanks,
Armin Wolf

