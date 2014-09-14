From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH v5] thinkpad-acpi: Improve hardware
 volume controls
Date: Sat, 13 Sep 2014 22:42:28 -0300
Message-ID: <20140914014228.GB30934@khazad-dum.debian.net>
References: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
 <CAObL_7F-w3f8R039JcenMeGpWx3dXrb6V3tVgxny7SJy717NNQ@mail.gmail.com>
 <20140912230344.GA8502@khazad-dum.debian.net>
 <CAObL_7EiSuP=vYo7sFF-0UxuO37Q_pNV6g5P5cwUe9oZuuTiFg@mail.gmail.com>
 <20140912233231.GA30851@khazad-dum.debian.net>
 <CAObL_7HqBrd2J6VfJxG1DODi5sP-hCwxeX+4kb6T62-ZiCNnFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:58526 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752232AbaINBml (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 13 Sep 2014 21:42:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by gateway2.nyi.internal (Postfix) with ESMTP id 1C4E620986
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2014 21:42:41 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <CAObL_7HqBrd2J6VfJxG1DODi5sP-hCwxeX+4kb6T62-ZiCNnFA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Lutomirski <luto@mit.edu>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

On Sat, 13 Sep 2014, Andrew Lutomirski wrote:
> I remain unconvinced that the latch and toggle modes are very useful
> given the state of existing userspace code.  PulseAudio, at least,
> appears to be entirely unable to understand that, if the "ThinkPad

Let's not go there.

> If we were to try to teach ALSA that the ThinkPad hardware mute switch
> were a part of the system's audio mixer, I think that all the modes

Let's try for that first, then.  It is a proper, sound (heh) solution.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
