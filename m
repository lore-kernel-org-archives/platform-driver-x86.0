From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add support for keyboard
 backlight
Date: Tue, 12 Jan 2016 16:20:15 -0200
Message-ID: <1452622815.408163.490114450.23398941@webmail.messagingengine.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali> <20160111211228.GA4171@sig21.net>
 <1452614830.376787.489968026.5FAEDB86@webmail.messagingengine.com>
 <569541B4.1020905@kevinlocke.name>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <569541B4.1020905@kevinlocke.name>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Locke <kevin@kevinlocke.name>, ibm-acpi-devel@lists.sourceforge.net
Cc: Johannes Stezenbach <js@sig21.net>, =?ISO-8859-1?Q?Pali=20Roh=E1r?= <pali.rohar@gmail.com>, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>, platform-driver-x86@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 12, 2016, at 16:11, Kevin Locke wrote:
> I looked through the DSDT and SSDT AML on the T430 (which also has both 
> a keyboard backlight and ThinkLight) and couldn't deduce which method 
> was being invoked for Fn+Space or an analog to MLCG/MLCS for the 
> ThinkLight.  However, that may be due to my inexperience interpreting 
> AML.  I'll keep looking/learning.

It calls directly into the SMBIOS :-(

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
