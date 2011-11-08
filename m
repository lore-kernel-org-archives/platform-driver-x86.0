From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [lm-sensors] A new Subsystem for Current Management
Date: Tue, 8 Nov 2011 16:54:26 +0000
Message-ID: <20111108165426.GB21630@sirena.org.uk>
References: <D6D887BA8C9DFF48B5233887EF04654109F102E3BC@bgsmsx502.gar.corp.intel.com>
 <CADkCAuv16KY4B-A-Oym-1pX+7WmP2WWzRZMsKeB_1=7-DfDASw@mail.gmail.com>
 <D6D887BA8C9DFF48B5233887EF04654109F102E436@bgsmsx502.gar.corp.intel.com>
 <20111106141302.40365383@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:52898 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752984Ab1KHQyc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Nov 2011 11:54:32 -0500
Content-Disposition: inline
In-Reply-To: <20111106141302.40365383@endymion.delvare>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: "R, Durgadoss" <durgadoss.r@intel.com>, lm-sensors@lm-sensors.org, Alan Cox <alan@linux.intel.com>, platform-driver-x86@vger.kernel.org

On Sun, Nov 06, 2011 at 02:13:02PM +0100, Jean Delvare wrote:

> While the regulator subsystem presents itself as aiming at power
> savings to improve battery life, it doesn't seem fundamentally
> different from the need you described. Whether you lower current draw
> to save battery life or to prevent the hardware from dying, makes
> little difference, the underlying mechanisms should be pretty similar.

Actually the regulator API isn't really about power savings - it's about
voltage and current regulation.  Higher layers can use these features to
save power but it's not somethnig the regulator API cares about.  If the
documentation suggests it is we might want to fix that up.
