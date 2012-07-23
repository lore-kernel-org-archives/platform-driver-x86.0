From: =?ISO-8859-1?Q?Miguel_G=F3mez?= <magomez@igalia.com>
Subject: Re: [PATCH 1/1 v2] classmate-laptop: Add support for Classmate V4
 accelerometer.
Date: Mon, 23 Jul 2012 15:44:41 +0200
Message-ID: <500D5549.3040109@igalia.com>
References: <cover.1340976795.git.magomez@igalia.com> <39ac42c709e498fbef4f0f0f24edc5331e5f4473.1340976795.git.magomez@igalia.com> <20120717224749.GA20813@nautilus.holoscopio.com> <5006BFEC.1010407@igalia.com> <20120723132841.GD21495@srcf.ucam.org> <500D52A7.8040606@igalia.com> <20120723133618.GC21838@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120723133618.GC21838@srcf.ucam.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, don@syst.com.br, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

El 23/07/12 15:36, Matthew Garrett escribi=F3:
> On Mon, Jul 23, 2012 at 03:33:27PM +0200, Miguel G=F3mez wrote:
>
>> Names are upper-cased in acpica, so the device is reported as
>> FNBT0000. But in the driver it's named FnBT0000, and that's why it
>> doesn't match.
>
> So just change the existing entry in the driver to FNBT0000?

I'd go for it. I can send a patch if you want. But not sure about=20
Thadeu's opinion. In the old thread it seems that he wanted to explore=20
other options besides that.

Do you agree with that change Thadeu?


--=20
Miguel G=F3mez
Igalia - http://www.igalia.com
