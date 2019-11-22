From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH] Revert "platform/x86: wmi: Destroy on cleanup rather than unregister"
Date: Fri, 22 Nov 2019 13:09:56 +0100
Message-ID: <8736eg5cyz.fsf@miraculix.mork.no>
References: <20191115052710.46880-1-yongxin.liu@windriver.com>
        <87blt45eew.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87blt45eew.fsf@miraculix.mork.no> (=?utf-8?Q?=22Bj=C3=B8rn?=
 Mork"'s message of
        "Fri, 22 Nov 2019 12:38:47 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Yongxin Liu <yongxin.liu@windriver.com>
Cc: andy@infradead.org, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mario.limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

Bj=C3=B8rn Mork <bjorn@mork.no> writes:

> Maybe we should add a WARN_ON(!MAJOR(devt)) or similar to
> device_destroy() to prevent similar future problems?

No, that's definitely not a good idea.  We have examples like
drivers/tty/vt/vt.c which (ab)use the devt with zero major and a
unique minor to keep track of devices.  So forget about any warning.

But the device_destroy's with a static MKDEV(0,0) should be removed.



Bj=C3=B8rn
