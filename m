From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH 5/6] toshiba_bluetooth: Change BT status message to debug
Date: Tue, 28 Apr 2015 17:16:19 +0200
Message-ID: <87zj5sgu64.fsf@nemi.mork.no>
References: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
	<1430166770-15060-6-git-send-email-coproscefalo@gmail.com>
	<87pp6oiu18.fsf@nemi.mork.no>
	<CAGdLNWGJger9MRmd0NQaooiuMPjGJA1rG+xGSJWtF84UEU+CFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGdLNWGJger9MRmd0NQaooiuMPjGJA1rG+xGSJWtF84UEU+CFQ@mail.gmail.com>
	(Azael Avalos's message of "Tue, 28 Apr 2015 09:08:32 -0600")
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Azael Avalos <coproscefalo@gmail.com> writes:

> Well, I was under the impression that what really gets printed is:
> toshiba_bluetooth: killswitch 1

Ah, right.  Yes, I missed the

 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

you already had in the module.  That helps a lot.


Bj=C3=B8rn
