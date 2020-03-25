From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2] platform: x86: Add ACPI driver for ChromeOS
Date: Wed, 25 Mar 2020 15:38:28 -0700
Message-ID: <6f90d8fa0301b19ddae3e7558df6408e23f4e04b.camel@linux.intel.com>
References: <20200322094334.1872663-1-enric.balletbo@collabora.com>
         <20200322111022.GA72939@kroah.com>
         <c480f318-c326-d51c-e757-c65c2526ab4d@collabora.com>
         <20200324164956.GE2518746@kroah.com>
         <3444110c-d6c0-16df-9b5d-12578ed442c5@collabora.com>
         <3166e472e0ef5c0db8da3ab7d846b47795e69057.camel@linux.intel.com>
         <fbd5e95a-59ab-bb51-892e-ddd220b85215@collabora.com>
         <51a98cae11de1529bdaa695a0c1eeb2043191b3f.camel@linux.intel.com>
         <e29d6279-d7e3-8164-3f52-5017bfe79436@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e29d6279-d7e3-8164-3f52-5017bfe79436@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, vbendeb@chromium.org, groeck@chromium.org, bleung@chromium.org, dtor@chromium.org, gwendal@chromium.org, andy@infradead.org, Collabora Kernel ML <kernel@collabora.com>, Ayman Bagabas <ayman.bagabas@gmail.com>, Darren Hart <dvhart@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jeremy Soller <jeremy@system76.com>, Mattias Jacobsson <2pi@mok.nu>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rajat Jain <rajatja@google.com>, Yauhen Kharuzhy <jekhor@gmail.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2020-03-25 at 22:54 +0100, Enric Balletbo i Serra wrote:
> Hi Srinivas,
> 

[cut]

> Evaluating \CRHW.HWID
> 0x1 Outstanding allocations after evaluation of \CRHW.HWID
> Evaluation of \CRHW.HWID returned object 0x55b9e373fd60, external
> buffer length 38
>   [Package] Contains 1 Elements:
>     [String] Length 00 = ""
> 
> 
> I found that the VBTx are addresses setup in the following file.
> 
> src/vendorcode/google/chromeos/acpi/gnvs.asl:
> 
> VBT0,   32,     // 0x000 - Boot Reason
> VBT1,   32,     // 0x004 - Active Main Firmware
> VBT2,   32,     // 0x008 - Active EC Firmware
> VBT3,   16,     // 0x00c - CHSW
> VBT4, 2048,     // 0x00e - HWID
> VBT5,  512,     // 0x10e - FWID
> VBT6,  512,     // 0x14e - FRID
> VBT7,   32,     // 0x18e - active main firmware type
> VBT8,   32,     // 0x192 - Recovery Reason
> VBT9,   32,     // 0x196 - FMAP base address
> CHVD, 24576,    // 0x19a - VDAT space filled by verified boot
> VBTA,   32,     // 0xd9a - pointer to smbios FWID
> MEHH,  256,     // 0xd9e - Management Engine Hash
> RMOB,   32,     // 0xdbe - RAM oops base address
> RMOL,   32,     // 0xdc2 - RAM oops length
> ROVP,   32,     // 0xdc6 - pointer to RO_VPD
> ROVL,   32,     // 0xdca - size of RO_VPD
> RWVP,   32,     // 0xdce - pointer to RW_VPD
> RWVL,   32,     // 0xdd2 - size of RW_VPD
>                 // 0xdd6
> 
> Can I assume that the info I want is only accessible in runtime and
> is not
> exported via the static tables?
Yes. Basically these are pointing to a memory address. From user space
you can't read this memory. We are planing to do something for this,
but it will take sometime.

Thanks,
Srinivas



> 
> Thanks,
>  Enric
