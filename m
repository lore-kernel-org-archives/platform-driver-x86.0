From: Darren Hart <dvhart@infradead.org>
Subject: Re: [RFC v5] asus-wmi: add fan control
Date: Wed, 13 May 2015 11:08:17 -0700
Message-ID: <20150513180817.GA1317@fury.dvhart.com>
References: <cover.1429653764.git.kastbernd@gmx.de>
 <20150513142416.GA15503@ASUS-Bernd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150513142416.GA15503@ASUS-Bernd>
Sender: linux-kernel-owner@vger.kernel.org
To: Kast Bernd <kastbernd@gmx.de>
Cc: corentin.chary@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, Matthew Garrett <mjg59@srcf.ucam.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 13, 2015 at 04:24:16PM +0200, Kast Bernd wrote:
> This patch is partially based on Felipe Contrera's earlier patch, that
> was discussed here: https://lkml.org/lkml/2013/10/8/800
> Some problems of that patch are solved, now:
> 
> 1) The main obstacle for the earlier patch seemed to be the use of
> virt_to_phys, which is accepted, now
> 
> 2) random memory corruption occurred on my notebook, thus DMA-able memory
> is allocated now, which solves this problem
> 
> 3) hwmon interface is used instead of the thermal interface, as a
> hwmon device is already set up by this driver and seemed more
> appropriate than the thermal interface
> 
> 4) Calling the ACPI-functions was modularized thus it's possible to call
> some multifunctions easily, now (by using
> asus_wmi_evaluate_method_agfn).
> 
> Unfortunately the WMI doesn't support controlling both fans on
> a dual-fan notebook because of an restriction in the acpi-method
> "SFNS", that is callable through the wmi. If "SFNV" would be called
> directly even dual fan configurations could be controlled, but not by using
> wmi.
> 
> Speed readings only work on auto-mode, thus "-1" will be reported in
> manual mode.
> Additionally the speed readings are reported as hundreds of RPM thus
> they are not too precise.
> 
> This patch is tested only on one notebook (N551JK) but a similar module,
> that contained some code to try to control the second fan also, was
> reported to work on an UX32VD, at least for the first fan.
> 
> As Felipe already mentioned the low-level functions are described here:
> http://forum.notebookreview.com/threads/fan-control-on-asus-prime-ux31-ux31a-ux32a-ux32vd.705656/
> 
> Signed-off-by: Kast Bernd <kastbernd@gmx.de>
> Acked-By: Corentin Chary <corentin.chary@gmail.com>

Acked-by (lowercase b, checkpatch complains, picky thing, but people have scripts that run
against this stuff, so it's important). I fixed it up locally.

> Cc: Corentin Chary <corentin.chary@gmail.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Matthew Garrett <mjg59@srcf.ucam.org>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>

Queued to next for 4.2. Thanks Kast.

-- 
Darren Hart
Intel Open Source Technology Center
