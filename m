From: Kevin Locke <kevin@kevinlocke.name>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add support for keyboard
 backlight
Date: Tue, 12 Jan 2016 10:11:00 -0800
Message-ID: <569541B4.1020905@kevinlocke.name>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali> <20160111211228.GA4171@sig21.net>
 <1452614830.376787.489968026.5FAEDB86@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452614830.376787.489968026.5FAEDB86@webmail.messagingengine.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net
Cc: Johannes Stezenbach <js@sig21.net>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>, platform-driver-x86@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On 01/12/2016 08:07 AM, Henrique de Moraes Holschuh wrote:
> On Mon, Jan 11, 2016, at 19:12, Johannes Stezenbach wrote:
>> I can confirm this, my x230 has both.  FWIW, BIOS hotkey
>> Fn+Space cycles through off, dim backlight, full backlight
>> and full thinklight. /sys/class/leds/tpacpi::thinklight/brightness
>> can be read (showing either 0 or 255) but writes are ignored.
>> Dito for /proc/acpi/ibm/light.
>
> We likely need to integrate better (future work) the new backlight
> control with the thinklight control and the firmware interface in the
> x230.
>
> Is the ACPI AML for fn+space readable enough, or is it trapping directly
> into SMM?  Because if it interacts with the traditional higher-level
> ACPI AML we already use to talk to the thinklight (and now to the
> backlight), it should be relatively easy to fix the driver to better
> support the x230.

I looked through the DSDT and SSDT AML on the T430 (which also has both 
a keyboard backlight and ThinkLight) and couldn't deduce which method 
was being invoked for Fn+Space or an analog to MLCG/MLCS for the 
ThinkLight.  However, that may be due to my inexperience interpreting 
AML.  I'll keep looking/learning.

I've posted the files online if anyone else has time/interest to take a 
look:  https://kevinlocke.name/misc/t430-acpi/

Best regards,
Kevin
