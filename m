From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [RFC 07/24] x86/thinkpad_acpi: Use
 arch_nvram_ops methods instead of nvram_read_byte() and nvram_write_byte()
Date: Tue, 02 Jun 2015 07:09:28 -0300
Message-ID: <1433239768.902135.284523153.1200C3E3@webmail.messagingengine.com>
References: <20150531010132.289674310@telegraphics.com.au>
	<20150531010134.129479218@telegraphics.com.au>
	<20150531041114.GA30431@khazad-dum.debian.net>
	<alpine.LNX.2.00.1505311605420.23528@nippy.intranet>
	<20150531143422.GA12337@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20150531143422.GA12337-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Finn Thain <fthain-PnMVE5gNl/W9dxLkCovUHLpzq4S04n8Q@public.gmane.org>
Cc: linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Test results were sent to me privately, and they are correct, so...

Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>

On Sun, May 31, 2015, at 11:34, Henrique de Moraes Holschuh wrote:
> On Sun, 31 May 2015, Finn Thain wrote:
> > On Sun, 31 May 2015, Henrique de Moraes Holschuh wrote:
> > > On Sun, 31 May 2015, Finn Thain wrote:
> > > > Make use of arch_nvram_ops in the thinkpad_acpi driver so that the 
> > > > nvram_* function exports can be removed.
> > > > 
> > > > This patch series was tested on a ThinkPad T43.
> > > 
> > > Can you describe how you did the testing?  A specific procedure is 
> > > required to test the hotkey NVRAM polling codepaths (which will read 
> > > several NVRAM bytes @10Hz by default) in a T43...
> > > 
> > > > Signed-off-by: Finn Thain <fthain-PnMVE5gNl/W9dxLkCovUHLpzq4S04n8Q@public.gmane.org>
> > > 
> > > The patch looks correct, so I don't expect any problems.
> > > 
> > > Provided that your test procedure did enable hotkey NVRAM polling in the 
> > > T43 and your hotkeys all still worked fine, you have my Acked-by.
> > 
> > The procedure I used was this,
> > 
> > 1. $ xev
> > 2. # rmmod thinkpad_acpi
> > 3. Press <Access IBM> key and confirm that xev does not report any
> >    events.
> > 4. # modprobe thinkpad_acpi
> > 5. Press <Access IBM> key and confirm that xev now reports the key press 
> >    events.
> > 
> > Is this sufficient?
> 
> No.  Please try:
> 
> modprobe thinkpad_acpi
> echo 0xfb88c0 > /sys/devices/platform/thinkpad_acpi/hotkey_source_mask
> 
> test the hotkeys.  Please test several of them, as not all of them are
> available through NVRAM polling... at least Fn+SPACE, Fn+F1..FN+F12
> 
> Please test the brightness keys. In the T43 we use "direct EC mode",
> which
> depends on the NVRAM to sync with the SMBIOS firmware.
> 
> to reset the driver to normal mode, it is enough to do this:
> echo 0 > /sys/devices/platform/thinkpad_acpi/hotkey_source_mask

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

------------------------------------------------------------------------------
