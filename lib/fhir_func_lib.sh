################################################################################
# function: patient_json_seed_data
################################################################################
function patient_json_seed_data ()
{

     local INDX="$1"
     local SEED_DATA

     if [[ ${INDX} -eq 0 ]]
     then
         INDX=1
     fi
      #SEED_DATA="{ \"name\" : \"AC3$((${RANDOM}/$INDX + $INDX )) Phone\", \"brand\" : \"ACME$((${RANDOM}/$INDX + $INDX ))\", \"type\" : \"phone\", \"price\" : 200, \"warranty_years\" : 1, \"available\" : true, \"description\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget elit ut nulla tempor viverra vel eu nulla. Sed luctus porttitor urna, ac dapibus velit fringilla et. Donec iaculis, dolor a vehicula dictum, augue neque suscipit augue, nec mollis massa neque in libero. Donec sed dapibus magna. Pellentesque at condimentum dolor. In nunc nibh, dignissim in risus a, blandit tincidunt velit. Vestibulum rutrum tempus sem eget tempus. Mauris sollicitudin purus auctor dolor vestibulum, vitae pulvinar neque suscipit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus lacus turpis, vulputate at adipiscing viverra, ultricies at lectus. Pellentesque ut porta leo, vel eleifend neque. Nunc sagittis metus at ante pellentesque, ut condimentum libero semper. In hac habitasse platea dictumst. In dapibus posuere posuere. Fusce vulputate augue eget tellus molestie, vitae egestas ante malesuada. Phasellus nunc mi, faucibus at elementum pharetra, aliquet a enim. In purus est, vulputate in nibh quis, faucibus dapibus magna. In accumsan libero velit, eu accumsan sem commodo id. In fringilla tempor augue, et feugiat erat convallis et. Sed aliquet eget ipsum eu vestibulum.Curabitur blandit leo nec condimentum semper. Mauris lectus sapien, rutrum a tincidunt id, euismod ac elit. Mauris suscipit et arcu et auctor. Quisque mollis magna vel mi viverra rutrum. Nulla non pretium magna. Cras sed tortor non tellus rutrum gravida eu at odio. Aliquam cursus fermentum erat, nec ullamcorper sem gravida sit amet. Donec viverra, erat vel ornare pulvinar, est ipsum accumsan massa, eu tristique lorem ante nec tortor. Sed suscipit iaculis faucibus. Maecenas a suscipit ligula, vitae faucibus turpis.Cras sed tellus auctor, tempor leo eu, molestie leo. Suspendisse ipsum tellus, egestas et ultricies eu, tempus a arcu. Cras laoreet, est dapibus consequat varius, nisi nisi placerat leo, et dictum ante tortor vitae est. Duis eu urna ac felis ullamcorper rutrum. Quisque iaculis, enim eget sodales vehicula, magna orci dignissim eros, nec volutpat massa urna in elit. In interdum pellentesque risus, feugiat pulvinar odio eleifend sit amet. Quisque congue libero quis dolor faucibus, a mollis nisl tempus.\" }"
      SEED_DATA="
			{
			  \"resourceType\": \"Patient\",
			  \"text\": {
			    \"status\": \"generated\",
			    \"div\": \"<div>\\n      <table>\\n        <tbody>\\n          <tr>\\n            <td>Name</td>\\n            <td>Peter James <b>Chalmers</b> (&quot;Jim&quot;)</td>\\n          </tr>\\n          <tr>\\n            <td>Address</td>\\n            <td>534 Erewhon, Pleasantville, Vic, 3999</td>\\n          </tr>\\n          <tr>\\n            <td>Contacts</td>\\n            <td>Home: unknown. Work: (03) 5555 6473</td>\\n          </tr>\\n          <tr>\\n            <td>Id</td>\\n            <td>MRN: 12345 (Acme Healthcare)</td>\\n          </tr>\\n        </tbody>\\n      </table>\\n    </div>\"
			  },
			  \"identifier\": [
			    {
			      \"use\": \"usual\",
			      \"label\": \"MRN\",
			      \"system\": \"urn:oid:1.2.36.146.595.217.0.1\",
			      \"value\": \"12345\",
			      \"period\": {
			        \"start\": \"2001-05-06\"
			      },
			      \"assigner\": {
			        \"display\": \"Acme Healthcare\"
			      }
			    }
			  ],
			  \"name\": [
			    {
			      \"use\": \"official\",
			      \"family\": [
			        \"family$((${RANDOM}/$INDX + $INDX ))\"
			      ],
			      \"given\": [
			        \"given1$((${RANDOM}/$INDX + $INDX ))\",
			        \"given2$((${RANDOM}/$INDX + $INDX ))\"
			      ]
			    },
			    {
			      \"use\": \"usual\",
			      \"given\": [
			        \"given3$((${RANDOM}/$INDX + $INDX ))\"
			      ]
			    }
			  ],
			  \"telecom\": [
			    {
			      \"use\": \"home\"
			    },
			    {
			      \"system\": \"phone\",
			      \"value\": \"(03) 5555 6473\",
			      \"use\": \"work\"
			    }
			  ],
			  \"gender\": {
			    \"coding\": [
			      {
			        \"system\": \"http://hl7.org/fhir/v3/AdministrativeGender\",
			        \"code\": \"M\",
			        \"display\": \"Male\"
			      }
			    ]
			  },
			  \"birthDate\": \"1974-12-25\",
			  \"deceasedBoolean\": false,
			  \"address\": [
			    {
			      \"use\": \"home\",
			      \"line\": [
			        \"534 Erewhon St\"
			      ],
			      \"city\": \"PleasantVille\",
			      \"state\": \"Vic\",
			      \"zip\": \"3999\"
			    }
			  ],
			  \"contact\": [
			    {
			      \"relationship\": [
			        {
			          \"coding\": [
			            {
			              \"system\": \"http://hl7.org/fhir/patient-contact-relationship\",
			              \"code\": \"partner\"
			            }
			          ]
			        }
			      ],
			      \"name\": {
			        \"family\": [
			          \"du\",
			          \"Marché\"
			        ],
			        \"_family\": [
			          {
			            \"extension\": [
			              {
			                \"url\": \"http://hl7.org/fhir/Profile/iso-21090#qualifier\",
			                \"valueCode\": \"VV\"
			              }
			            ]
			          },
			          null
			        ],
			        \"given\": [
			          \"Bénédicte\"
			        ]
			      },
			      \"telecom\": [
			        {
			          \"system\": \"phone\",
			          \"value\": \"+33 (237) 998327\"
			        }
			      ]
			    }
			  ],
			  \"managingOrganization\": {
			    \"reference\": \"Organization/1\"
			  },
			  \"active\": true
			}"

  echo "${SEED_DATA}"
}
